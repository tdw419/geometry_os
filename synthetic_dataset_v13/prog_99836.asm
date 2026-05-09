; DESCRIPTION: Composite: Creates a purple rectangular region at (76, 186) spanning 113 by 70 pixels then Places a black circle of radius 76 at center (118, 110).
; PLAN: r0=76(x), r1=186(y), r2=113(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=110(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 186
LDI r2, 113
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 110
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
