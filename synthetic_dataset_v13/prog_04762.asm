; DESCRIPTION: Places a green line segment connecting (105, 116) to (432, 180).
; PLAN: r0=105(x1), r1=116(y1), r2=432(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 116
LDI r2, 432
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
