; DESCRIPTION: Renders a blue line between points (300, 156) and (270, 18).
; PLAN: r0=300(x1), r1=156(y1), r2=270(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 156
LDI r2, 270
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
