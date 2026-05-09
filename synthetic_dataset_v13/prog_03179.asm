; DESCRIPTION: Composite: Places a magenta line segment connecting (83, 66) to (142, 3) then Sets a single magenta pixel at (231, 96) then Renders a green disk with center (235, 108) and radius 61.
; PLAN: r0=83(x1), r1=66(y1), r2=142(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=96(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=235(x), r11=108(y), r12=61(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 83
LDI r1, 66
LDI r2, 142
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 96
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 235
LDI r11, 108
LDI r12, 61
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
