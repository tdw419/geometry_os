; DESCRIPTION: Places a green line segment connecting (90, 105) to (151, 85).
; PLAN: r0=90(x1), r1=105(y1), r2=151(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 105
LDI r2, 151
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
