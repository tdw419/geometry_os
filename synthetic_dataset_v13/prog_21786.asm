; DESCRIPTION: Renders a blue line between points (449, 210) and (6, 250).
; PLAN: r0=449(x1), r1=210(y1), r2=6(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 210
LDI r2, 6
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
