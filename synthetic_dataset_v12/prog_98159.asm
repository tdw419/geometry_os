; DESCRIPTION: Composite: Sets a single blue pixel at (132, 121) then Renders a black line between points (79, 112) and (370, 239) then Creates a purple circular shape at (237, 147) with radius 48.
; PLAN: r0=132(x), r1=121(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=79(x1), r6=112(y1), r7=370(x2), r8=239(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=147(y), r12=48(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 121
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 112
LDI r7, 370
LDI r8, 239
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 147
LDI r12, 48
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
