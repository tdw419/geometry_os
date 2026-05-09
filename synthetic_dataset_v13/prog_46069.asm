; DESCRIPTION: Renders a green line between points (244, 5) and (133, 2).
; PLAN: r0=244(x1), r1=5(y1), r2=133(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 5
LDI r2, 133
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
