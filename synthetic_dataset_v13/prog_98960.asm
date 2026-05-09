; DESCRIPTION: Renders a blue line between points (406, 80) and (244, 132).
; PLAN: r0=406(x1), r1=80(y1), r2=244(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 80
LDI r2, 244
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
