; DESCRIPTION: Renders a blue line between points (413, 38) and (258, 90).
; PLAN: r0=413(x1), r1=38(y1), r2=258(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 38
LDI r2, 258
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
