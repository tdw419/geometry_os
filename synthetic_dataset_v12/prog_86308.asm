; DESCRIPTION: Renders a blue line between points (313, 86) and (244, 33).
; PLAN: r0=313(x1), r1=86(y1), r2=244(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 86
LDI r2, 244
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
