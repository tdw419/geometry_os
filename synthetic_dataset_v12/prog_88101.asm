; DESCRIPTION: Renders a blue line between points (276, 244) and (153, 137).
; PLAN: r0=276(x1), r1=244(y1), r2=153(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 244
LDI r2, 153
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
