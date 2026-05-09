; DESCRIPTION: Renders a green line between points (99, 34) and (511, 145).
; PLAN: r0=99(x1), r1=34(y1), r2=511(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 34
LDI r2, 511
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
