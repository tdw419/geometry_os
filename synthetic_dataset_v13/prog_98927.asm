; DESCRIPTION: Renders a yellow line between points (22, 111) and (302, 70).
; PLAN: r0=22(x1), r1=111(y1), r2=302(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 111
LDI r2, 302
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
