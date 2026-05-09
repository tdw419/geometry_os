; DESCRIPTION: Renders a blue line between points (317, 57) and (253, 14).
; PLAN: r0=317(x1), r1=57(y1), r2=253(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 57
LDI r2, 253
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
