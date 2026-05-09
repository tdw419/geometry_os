; DESCRIPTION: Renders a yellow line between points (395, 188) and (30, 84).
; PLAN: r0=395(x1), r1=188(y1), r2=30(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 188
LDI r2, 30
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
