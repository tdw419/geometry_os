; DESCRIPTION: Draws a yellow line from (501, 78) to (371, 25).
; PLAN: r0=501(x1), r1=78(y1), r2=371(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 78
LDI r2, 371
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
