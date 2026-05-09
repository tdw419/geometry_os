; DESCRIPTION: Places a red line segment connecting (436, 145) to (44, 10).
; PLAN: r0=436(x1), r1=145(y1), r2=44(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 145
LDI r2, 44
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
