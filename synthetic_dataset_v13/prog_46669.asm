; DESCRIPTION: Draws a blue line from (390, 129) to (289, 103).
; PLAN: r0=390(x1), r1=129(y1), r2=289(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 129
LDI r2, 289
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
