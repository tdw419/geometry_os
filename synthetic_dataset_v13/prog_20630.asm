; DESCRIPTION: Composite: Draws a blue circle centered at (359, 202) with radius 51 then Sets a single orange pixel at (352, 253) then Creates a green rectangular region at (44, 144) spanning 89 by 69 pixels.
; PLAN: r0=359(x), r1=202(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=253(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=44(x), r11=144(y), r12=89(width), r13=69(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 202
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 253
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 44
LDI r11, 144
LDI r12, 89
LDI r13, 69
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
