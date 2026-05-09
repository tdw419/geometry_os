; DESCRIPTION: Renders a blue line between points (199, 255) and (72, 71).
; PLAN: r0=199(x1), r1=255(y1), r2=72(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 255
LDI r2, 72
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
