; DESCRIPTION: Renders a green line between points (3, 121) and (393, 145).
; PLAN: r0=3(x1), r1=121(y1), r2=393(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 121
LDI r2, 393
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
