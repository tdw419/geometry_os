; DESCRIPTION: Places a yellow line segment connecting (0, 51) to (187, 247).
; PLAN: r0=0(x1), r1=51(y1), r2=187(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 51
LDI r2, 187
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
