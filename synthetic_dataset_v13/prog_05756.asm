; DESCRIPTION: Renders a blue line between points (126, 94) and (199, 247).
; PLAN: r0=126(x1), r1=94(y1), r2=199(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 94
LDI r2, 199
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
