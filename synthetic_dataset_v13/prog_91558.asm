; DESCRIPTION: Renders a blue line between points (413, 145) and (3, 82).
; PLAN: r0=413(x1), r1=145(y1), r2=3(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 145
LDI r2, 3
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
