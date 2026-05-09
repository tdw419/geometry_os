; DESCRIPTION: Renders a blue line between points (449, 131) and (473, 208).
; PLAN: r0=449(x1), r1=131(y1), r2=473(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 131
LDI r2, 473
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
