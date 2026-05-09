; DESCRIPTION: Places a red line segment connecting (43, 127) to (77, 105).
; PLAN: r0=43(x1), r1=127(y1), r2=77(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 127
LDI r2, 77
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
