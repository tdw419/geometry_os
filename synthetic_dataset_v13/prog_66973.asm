; DESCRIPTION: Renders a blue line between points (0, 244) and (199, 78).
; PLAN: r0=0(x1), r1=244(y1), r2=199(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 244
LDI r2, 199
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
