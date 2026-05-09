; DESCRIPTION: Renders a blue line between points (449, 57) and (14, 183).
; PLAN: r0=449(x1), r1=57(y1), r2=14(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 57
LDI r2, 14
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
