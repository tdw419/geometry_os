; DESCRIPTION: Renders a yellow line between points (463, 84) and (371, 2).
; PLAN: r0=463(x1), r1=84(y1), r2=371(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 84
LDI r2, 371
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
