; DESCRIPTION: Places a white line segment connecting (500, 65) to (365, 185).
; PLAN: r0=500(x1), r1=65(y1), r2=365(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 65
LDI r2, 365
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
