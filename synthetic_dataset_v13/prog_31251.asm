; DESCRIPTION: Draws a blue line from (72, 14) to (271, 99).
; PLAN: r0=72(x1), r1=14(y1), r2=271(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 14
LDI r2, 271
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
