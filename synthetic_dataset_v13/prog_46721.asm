; DESCRIPTION: Places a white line segment connecting (77, 127) to (36, 188).
; PLAN: r0=77(x1), r1=127(y1), r2=36(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 127
LDI r2, 36
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
