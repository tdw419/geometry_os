; DESCRIPTION: Places a red line segment connecting (145, 140) to (51, 29).
; PLAN: r0=145(x1), r1=140(y1), r2=51(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 140
LDI r2, 51
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
