; DESCRIPTION: Places a green line segment connecting (363, 56) to (151, 169).
; PLAN: r0=363(x1), r1=56(y1), r2=151(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 56
LDI r2, 151
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
