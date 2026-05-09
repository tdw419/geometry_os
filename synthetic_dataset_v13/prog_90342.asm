; DESCRIPTION: Renders a blue line between points (463, 26) and (30, 243).
; PLAN: r0=463(x1), r1=26(y1), r2=30(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 26
LDI r2, 30
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
