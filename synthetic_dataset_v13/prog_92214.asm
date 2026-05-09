; DESCRIPTION: Renders a blue line between points (417, 175) and (449, 199).
; PLAN: r0=417(x1), r1=175(y1), r2=449(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 175
LDI r2, 449
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
