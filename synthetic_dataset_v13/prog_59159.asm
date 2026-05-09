; DESCRIPTION: Renders a blue line between points (492, 124) and (308, 105).
; PLAN: r0=492(x1), r1=124(y1), r2=308(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 124
LDI r2, 308
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
