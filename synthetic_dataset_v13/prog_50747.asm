; DESCRIPTION: Places a red line segment connecting (330, 131) to (148, 211).
; PLAN: r0=330(x1), r1=131(y1), r2=148(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 131
LDI r2, 148
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
