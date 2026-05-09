; DESCRIPTION: Composite: Sets a single magenta pixel at (393, 191) then Renders a green disk with center (404, 172) and radius 35 then Places a orange line segment connecting (455, 103) to (179, 97).
; PLAN: r0=393(x), r1=191(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=172(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=455(x1), r11=103(y1), r12=179(x2), r13=97(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 191
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 404
LDI r6, 172
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 455
LDI r11, 103
LDI r12, 179
LDI r13, 97
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
