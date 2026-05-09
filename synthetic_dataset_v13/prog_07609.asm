; DESCRIPTION: Places a black line segment connecting (143, 118) to (112, 168).
; PLAN: r0=143(x1), r1=118(y1), r2=112(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 118
LDI r2, 112
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
