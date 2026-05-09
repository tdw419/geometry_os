; DESCRIPTION: Places a black line segment connecting (369, 86) to (261, 175).
; PLAN: r0=369(x1), r1=86(y1), r2=261(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 86
LDI r2, 261
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
