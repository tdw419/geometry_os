; DESCRIPTION: Renders a blue line between points (317, 15) and (422, 37).
; PLAN: r0=317(x1), r1=15(y1), r2=422(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 15
LDI r2, 422
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
