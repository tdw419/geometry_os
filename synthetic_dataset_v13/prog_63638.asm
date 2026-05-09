; DESCRIPTION: Places a white line segment connecting (24, 71) to (466, 80).
; PLAN: r0=24(x1), r1=71(y1), r2=466(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 71
LDI r2, 466
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
