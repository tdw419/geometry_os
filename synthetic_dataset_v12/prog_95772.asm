; DESCRIPTION: Composite: Places a orange dot at position (147, 220) then Renders a green disk with center (124, 143) and radius 38 then Places a magenta line segment connecting (500, 68) to (7, 176).
; PLAN: r0=147(x), r1=220(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=143(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x1), r11=68(y1), r12=7(x2), r13=176(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 220
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 124
LDI r6, 143
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 68
LDI r12, 7
LDI r13, 176
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
