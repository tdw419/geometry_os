; DESCRIPTION: Renders a orange line between points (491, 225) and (3, 235).
; PLAN: r0=491(x1), r1=225(y1), r2=3(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 225
LDI r2, 3
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
