; DESCRIPTION: Composite: Places a white circle of radius 48 at center (141, 105) then Renders a magenta line between points (42, 219) and (331, 8) then Sets a single blue pixel at (407, 138).
; PLAN: r0=141(x), r1=105(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x1), r6=219(y1), r7=331(x2), r8=8(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=138(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 141
LDI r1, 105
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 219
LDI r7, 331
LDI r8, 8
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 138
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
