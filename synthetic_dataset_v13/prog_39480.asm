; DESCRIPTION: Renders a orange line between points (347, 237) and (235, 150).
; PLAN: r0=347(x1), r1=237(y1), r2=235(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 237
LDI r2, 235
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
