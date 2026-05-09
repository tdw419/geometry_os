; DESCRIPTION: Renders a blue line between points (162, 167) and (449, 10).
; PLAN: r0=162(x1), r1=167(y1), r2=449(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 167
LDI r2, 449
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
