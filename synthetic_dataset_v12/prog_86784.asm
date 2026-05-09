; DESCRIPTION: Renders a blue line between points (400, 59) and (122, 216).
; PLAN: r0=400(x1), r1=59(y1), r2=122(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 59
LDI r2, 122
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
