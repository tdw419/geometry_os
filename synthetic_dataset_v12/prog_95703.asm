; DESCRIPTION: Renders a yellow line between points (135, 49) and (227, 193).
; PLAN: r0=135(x1), r1=49(y1), r2=227(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 49
LDI r2, 227
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
