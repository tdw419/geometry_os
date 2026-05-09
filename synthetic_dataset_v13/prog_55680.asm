; DESCRIPTION: Composite: Creates a purple circular shape at (254, 110) with radius 30 then Sets a single black pixel at (296, 55) then Renders a blue line between points (51, 186) and (215, 229).
; PLAN: r0=254(x), r1=110(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x), r6=55(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=51(x1), r11=186(y1), r12=215(x2), r13=229(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 110
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 55
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 51
LDI r11, 186
LDI r12, 215
LDI r13, 229
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
