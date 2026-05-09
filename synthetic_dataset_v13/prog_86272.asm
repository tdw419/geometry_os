; DESCRIPTION: Composite: Sets a single blue pixel at (299, 84) then Renders a yellow line between points (217, 109) and (252, 226) then Draws a blue circle centered at (16, 25) with radius 10.
; PLAN: r0=299(x), r1=84(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=217(x1), r6=109(y1), r7=252(x2), r8=226(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=16(x), r11=25(y), r12=10(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 299
LDI r1, 84
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 109
LDI r7, 252
LDI r8, 226
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 16
LDI r11, 25
LDI r12, 10
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
