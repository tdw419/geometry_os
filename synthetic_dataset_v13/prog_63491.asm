; DESCRIPTION: Renders a blue line between points (338, 57) and (323, 237).
; PLAN: r0=338(x1), r1=57(y1), r2=323(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 57
LDI r2, 323
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
