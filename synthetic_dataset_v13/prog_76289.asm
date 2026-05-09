; DESCRIPTION: Renders a green line between points (149, 60) and (132, 99).
; PLAN: r0=149(x1), r1=60(y1), r2=132(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 60
LDI r2, 132
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
