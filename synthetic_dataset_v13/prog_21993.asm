; DESCRIPTION: Composite: Creates a purple rectangular region at (54, 87) spanning 43 by 107 pixels then Places a orange circle of radius 17 at center (82, 29).
; PLAN: r0=54(x), r1=87(y), r2=43(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=29(y), r7=17(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 87
LDI r2, 43
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 29
LDI r7, 17
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
