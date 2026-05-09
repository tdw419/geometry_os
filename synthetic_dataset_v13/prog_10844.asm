; DESCRIPTION: Renders a blue line between points (237, 54) and (306, 247).
; PLAN: r0=237(x1), r1=54(y1), r2=306(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 54
LDI r2, 306
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
