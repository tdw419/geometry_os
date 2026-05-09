; DESCRIPTION: Places a white line segment connecting (145, 87) to (182, 130).
; PLAN: r0=145(x1), r1=87(y1), r2=182(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 87
LDI r2, 182
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
