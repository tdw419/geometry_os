; DESCRIPTION: Renders a blue line between points (143, 191) and (433, 122).
; PLAN: r0=143(x1), r1=191(y1), r2=433(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 191
LDI r2, 433
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
