; DESCRIPTION: Places a red line segment connecting (107, 254) to (251, 31).
; PLAN: r0=107(x1), r1=254(y1), r2=251(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 254
LDI r2, 251
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
