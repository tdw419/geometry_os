; DESCRIPTION: Draws a blue line from (396, 192) to (402, 174).
; PLAN: r0=396(x1), r1=192(y1), r2=402(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 192
LDI r2, 402
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
