; DESCRIPTION: Places a red line segment connecting (73, 167) to (51, 66).
; PLAN: r0=73(x1), r1=167(y1), r2=51(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 167
LDI r2, 51
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
