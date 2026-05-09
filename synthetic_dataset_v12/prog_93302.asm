; DESCRIPTION: Composite: Sets a single magenta pixel at (125, 33) then Draws a black line from (130, 131) to (488, 23) then Creates a white circular shape at (265, 145) with radius 80.
; PLAN: r0=125(x), r1=33(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=130(x1), r6=131(y1), r7=488(x2), r8=23(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=145(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 33
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 131
LDI r7, 488
LDI r8, 23
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 145
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
