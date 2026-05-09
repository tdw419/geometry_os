; DESCRIPTION: Composite: Sets a single white pixel at (448, 219) then Draws a black rectangle at (241, 26) with width 112 and height 102 then Creates a blue circular shape at (250, 152) with radius 14.
; PLAN: r0=448(x), r1=219(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=26(y), r7=112(width), r8=102(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=250(x), r11=152(y), r12=14(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 448
LDI r1, 219
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 26
LDI r7, 112
LDI r8, 102
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 152
LDI r12, 14
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
