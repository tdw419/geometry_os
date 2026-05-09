; DESCRIPTION: Composite: Places a green dot at position (417, 55) then Renders a magenta disk with center (432, 147) and radius 24 then Places a magenta line segment connecting (41, 135) to (357, 129).
; PLAN: r0=417(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=147(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x1), r11=135(y1), r12=357(x2), r13=129(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 55
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 432
LDI r6, 147
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 135
LDI r12, 357
LDI r13, 129
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
