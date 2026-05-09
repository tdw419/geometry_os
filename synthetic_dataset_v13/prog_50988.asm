; DESCRIPTION: Composite: Places a black line segment connecting (112, 103) to (458, 214) then Draws a green circle centered at (198, 125) with radius 66 then Sets a single blue pixel at (478, 193).
; PLAN: r0=112(x1), r1=103(y1), r2=458(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=125(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=478(x), r11=193(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 103
LDI r2, 458
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 125
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 478
LDI r11, 193
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
