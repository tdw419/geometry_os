; DESCRIPTION: Places a white line segment connecting (190, 145) to (426, 10).
; PLAN: r0=190(x1), r1=145(y1), r2=426(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 145
LDI r2, 426
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
