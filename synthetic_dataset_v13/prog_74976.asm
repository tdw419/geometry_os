; DESCRIPTION: Composite: Sets a single magenta pixel at (138, 244) then Draws a black line from (70, 142) to (74, 0) then Creates a blue circular shape at (421, 87) with radius 52.
; PLAN: r0=138(x), r1=244(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=70(x1), r6=142(y1), r7=74(x2), r8=0(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=421(x), r11=87(y), r12=52(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 138
LDI r1, 244
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 70
LDI r6, 142
LDI r7, 74
LDI r8, 0
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 87
LDI r12, 52
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
