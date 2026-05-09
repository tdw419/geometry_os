; DESCRIPTION: Renders a blue line between points (310, 44) and (172, 94).
; PLAN: r0=310(x1), r1=44(y1), r2=172(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 44
LDI r2, 172
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
