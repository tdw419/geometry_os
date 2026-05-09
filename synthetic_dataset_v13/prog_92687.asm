; DESCRIPTION: Places a white line segment connecting (112, 138) to (118, 66).
; PLAN: r0=112(x1), r1=138(y1), r2=118(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 138
LDI r2, 118
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
