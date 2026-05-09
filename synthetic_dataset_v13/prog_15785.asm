; DESCRIPTION: Renders a orange line between points (149, 197) and (23, 235).
; PLAN: r0=149(x1), r1=197(y1), r2=23(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 197
LDI r2, 23
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
