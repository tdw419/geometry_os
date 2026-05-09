; DESCRIPTION: Renders a blue line between points (200, 102) and (365, 160).
; PLAN: r0=200(x1), r1=102(y1), r2=365(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 102
LDI r2, 365
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
