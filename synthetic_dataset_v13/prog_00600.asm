; DESCRIPTION: Places a orange line segment connecting (450, 229) to (208, 235).
; PLAN: r0=450(x1), r1=229(y1), r2=208(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 229
LDI r2, 208
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
