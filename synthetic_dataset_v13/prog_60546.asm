; DESCRIPTION: Composite: Draws a orange circle centered at (161, 81) with radius 80 then Creates a purple rectangular region at (237, 19) spanning 37 by 106 pixels.
; PLAN: r0=161(x), r1=81(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=19(y), r7=37(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 81
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 19
LDI r7, 37
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
