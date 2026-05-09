; DESCRIPTION: Renders a blue line between points (185, 160) and (409, 172).
; PLAN: r0=185(x1), r1=160(y1), r2=409(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 160
LDI r2, 409
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
