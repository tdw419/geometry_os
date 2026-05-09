; DESCRIPTION: Renders a blue line between points (350, 191) and (338, 205).
; PLAN: r0=350(x1), r1=191(y1), r2=338(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 191
LDI r2, 338
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
