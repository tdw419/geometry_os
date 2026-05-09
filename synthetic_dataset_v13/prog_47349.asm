; DESCRIPTION: Composite: Places a orange dot at position (147, 176) then Renders a orange line between points (289, 67) and (433, 18) then Creates a magenta circular shape at (231, 113) with radius 52.
; PLAN: r0=147(x), r1=176(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=289(x1), r6=67(y1), r7=433(x2), r8=18(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=231(x), r11=113(y), r12=52(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 147
LDI r1, 176
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 289
LDI r6, 67
LDI r7, 433
LDI r8, 18
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 113
LDI r12, 52
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
