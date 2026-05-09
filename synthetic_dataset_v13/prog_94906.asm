; DESCRIPTION: Renders a blue line between points (270, 73) and (192, 33).
; PLAN: r0=270(x1), r1=73(y1), r2=192(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 73
LDI r2, 192
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
