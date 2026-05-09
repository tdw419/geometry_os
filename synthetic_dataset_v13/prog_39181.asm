; DESCRIPTION: Places a white line segment connecting (358, 47) to (36, 196).
; PLAN: r0=358(x1), r1=47(y1), r2=36(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 47
LDI r2, 36
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
