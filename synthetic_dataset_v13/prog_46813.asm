; DESCRIPTION: Renders a blue line between points (452, 243) and (56, 206).
; PLAN: r0=452(x1), r1=243(y1), r2=56(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 243
LDI r2, 56
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
