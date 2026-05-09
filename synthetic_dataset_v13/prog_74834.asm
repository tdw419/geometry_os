; DESCRIPTION: Draws a blue line from (60, 84) to (402, 214).
; PLAN: r0=60(x1), r1=84(y1), r2=402(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 84
LDI r2, 402
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
