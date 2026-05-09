; DESCRIPTION: Renders a green line between points (162, 227) and (449, 191).
; PLAN: r0=162(x1), r1=227(y1), r2=449(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 227
LDI r2, 449
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
