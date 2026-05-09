; DESCRIPTION: Renders a white line between points (84, 38) and (287, 149).
; PLAN: r0=84(x1), r1=38(y1), r2=287(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 38
LDI r2, 287
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
