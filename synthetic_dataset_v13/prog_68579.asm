; DESCRIPTION: Renders a purple line between points (178, 108) and (412, 35).
; PLAN: r0=178(x1), r1=108(y1), r2=412(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 108
LDI r2, 412
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
