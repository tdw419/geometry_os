; DESCRIPTION: Renders a yellow line between points (345, 75) and (134, 234).
; PLAN: r0=345(x1), r1=75(y1), r2=134(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 75
LDI r2, 134
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
