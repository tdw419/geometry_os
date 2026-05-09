; DESCRIPTION: Renders a blue line between points (400, 15) and (349, 28).
; PLAN: r0=400(x1), r1=15(y1), r2=349(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 15
LDI r2, 349
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
