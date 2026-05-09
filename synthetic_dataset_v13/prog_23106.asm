; DESCRIPTION: Renders a blue line between points (110, 181) and (242, 93).
; PLAN: r0=110(x1), r1=181(y1), r2=242(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 181
LDI r2, 242
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
