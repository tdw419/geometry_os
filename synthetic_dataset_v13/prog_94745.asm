; DESCRIPTION: Places a red line segment connecting (453, 85) to (329, 159).
; PLAN: r0=453(x1), r1=85(y1), r2=329(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 85
LDI r2, 329
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
