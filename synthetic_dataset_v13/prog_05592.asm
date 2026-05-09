; DESCRIPTION: Renders a blue line between points (402, 81) and (65, 151).
; PLAN: r0=402(x1), r1=81(y1), r2=65(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 81
LDI r2, 65
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
