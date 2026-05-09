; DESCRIPTION: Renders a blue line between points (199, 56) and (437, 200).
; PLAN: r0=199(x1), r1=56(y1), r2=437(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 56
LDI r2, 437
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
