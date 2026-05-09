; DESCRIPTION: Renders a green line between points (300, 90) and (244, 155).
; PLAN: r0=300(x1), r1=90(y1), r2=244(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 90
LDI r2, 244
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
