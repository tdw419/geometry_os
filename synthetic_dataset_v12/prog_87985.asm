; DESCRIPTION: Places a green line segment connecting (250, 109) to (71, 26).
; PLAN: r0=250(x1), r1=109(y1), r2=71(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 109
LDI r2, 71
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
