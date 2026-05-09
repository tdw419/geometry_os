; DESCRIPTION: Renders a green line between points (423, 131) and (109, 58).
; PLAN: r0=423(x1), r1=131(y1), r2=109(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 131
LDI r2, 109
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
