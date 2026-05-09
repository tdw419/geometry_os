; DESCRIPTION: Composite: Places a red dot at position (89, 149) then Renders a yellow disk with center (95, 164) and radius 35 then Places a magenta line segment connecting (137, 200) to (470, 147).
; PLAN: r0=89(x), r1=149(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=164(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x1), r11=200(y1), r12=470(x2), r13=147(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 149
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 95
LDI r6, 164
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 200
LDI r12, 470
LDI r13, 147
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
