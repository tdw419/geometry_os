; DESCRIPTION: Renders a black line between points (55, 80) and (230, 67).
; PLAN: r0=55(x1), r1=80(y1), r2=230(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 80
LDI r2, 230
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
