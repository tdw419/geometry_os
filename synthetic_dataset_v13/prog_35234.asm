; DESCRIPTION: Renders a blue line between points (105, 3) and (156, 212).
; PLAN: r0=105(x1), r1=3(y1), r2=156(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 3
LDI r2, 156
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
