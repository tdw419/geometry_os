; DESCRIPTION: Composite: Places a orange 110x112 rectangle at position (133, 110) then Draws a purple circle centered at (424, 142) with radius 71.
; PLAN: r0=133(x), r1=110(y), r2=110(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=142(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 110
LDI r2, 110
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 142
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
