; DESCRIPTION: Composite: Places a blue line segment connecting (9, 133) to (235, 107) then Sets a single yellow pixel at (365, 71) then Renders a orange disk with center (213, 109) and radius 60.
; PLAN: r0=9(x1), r1=133(y1), r2=235(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=71(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=213(x), r11=109(y), r12=60(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 133
LDI r2, 235
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 71
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 213
LDI r11, 109
LDI r12, 60
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
