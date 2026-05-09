; DESCRIPTION: Renders a blue line between points (181, 87) and (317, 156).
; PLAN: r0=181(x1), r1=87(y1), r2=317(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 87
LDI r2, 317
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
