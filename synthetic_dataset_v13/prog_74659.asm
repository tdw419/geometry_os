; DESCRIPTION: Composite: Creates a purple rectangular region at (342, 43) spanning 70 by 16 pixels then Places a green circle of radius 25 at center (64, 169) then Places a green dot at position (171, 73).
; PLAN: r0=342(x), r1=43(y), r2=70(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x), r6=169(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=73(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 43
LDI r2, 70
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 169
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 73
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
