; DESCRIPTION: Places a blue line segment connecting (35, 198) to (485, 253).
; PLAN: r0=35(x1), r1=198(y1), r2=485(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 198
LDI r2, 485
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
