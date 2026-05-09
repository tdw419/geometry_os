; DESCRIPTION: Places a red line segment connecting (247, 187) to (185, 136).
; PLAN: r0=247(x1), r1=187(y1), r2=185(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 187
LDI r2, 185
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
