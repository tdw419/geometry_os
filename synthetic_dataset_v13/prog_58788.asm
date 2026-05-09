; DESCRIPTION: Renders a blue line between points (454, 4) and (199, 6).
; PLAN: r0=454(x1), r1=4(y1), r2=199(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 4
LDI r2, 199
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
