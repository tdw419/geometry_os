; DESCRIPTION: Composite: Renders a blue line between points (48, 200) and (81, 162) then Creates a magenta circular shape at (260, 138) with radius 70 then Sets a single blue pixel at (285, 226).
; PLAN: r0=48(x1), r1=200(y1), r2=81(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=138(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=285(x), r11=226(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 48
LDI r1, 200
LDI r2, 81
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 138
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 285
LDI r11, 226
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
