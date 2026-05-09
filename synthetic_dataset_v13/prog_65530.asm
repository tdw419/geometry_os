; DESCRIPTION: Renders a blue line between points (280, 159) and (388, 36).
; PLAN: r0=280(x1), r1=159(y1), r2=388(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 159
LDI r2, 388
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
