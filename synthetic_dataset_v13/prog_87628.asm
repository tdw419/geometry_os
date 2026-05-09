; DESCRIPTION: Renders a blue line between points (244, 5) and (394, 140).
; PLAN: r0=244(x1), r1=5(y1), r2=394(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 5
LDI r2, 394
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
