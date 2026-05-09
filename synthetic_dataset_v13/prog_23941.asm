; DESCRIPTION: Draws a yellow line from (435, 83) to (389, 78).
; PLAN: r0=435(x1), r1=83(y1), r2=389(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 83
LDI r2, 389
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
