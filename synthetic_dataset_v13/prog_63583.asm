; DESCRIPTION: Composite: Sets a single blue pixel at (488, 136) then Renders a purple disk with center (94, 200) and radius 18 then Places a black line segment connecting (63, 14) to (37, 242).
; PLAN: r0=488(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=200(y), r7=18(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=63(x1), r11=14(y1), r12=37(x2), r13=242(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 200
LDI r7, 18
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 63
LDI r11, 14
LDI r12, 37
LDI r13, 242
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
