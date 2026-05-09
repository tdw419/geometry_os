; DESCRIPTION: Renders a green line between points (302, 212) and (13, 159).
; PLAN: r0=302(x1), r1=212(y1), r2=13(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 212
LDI r2, 13
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
