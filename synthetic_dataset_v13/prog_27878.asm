; DESCRIPTION: Renders a blue line between points (377, 96) and (403, 19).
; PLAN: r0=377(x1), r1=96(y1), r2=403(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 96
LDI r2, 403
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
