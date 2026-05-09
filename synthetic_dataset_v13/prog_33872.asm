; DESCRIPTION: Composite: Sets a single black pixel at (198, 175) then Renders a yellow line between points (493, 234) and (449, 51) then Renders a white disk with center (306, 132) and radius 69.
; PLAN: r0=198(x), r1=175(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=234(y1), r7=449(x2), r8=51(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=132(y), r12=69(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 198
LDI r1, 175
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 493
LDI r6, 234
LDI r7, 449
LDI r8, 51
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 132
LDI r12, 69
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
