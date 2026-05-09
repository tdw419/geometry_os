; DESCRIPTION: Renders a yellow line between points (326, 170) and (302, 169).
; PLAN: r0=326(x1), r1=170(y1), r2=302(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 170
LDI r2, 302
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
