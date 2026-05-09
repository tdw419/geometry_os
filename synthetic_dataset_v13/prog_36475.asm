; DESCRIPTION: Draws a blue line from (420, 53) to (86, 201).
; PLAN: r0=420(x1), r1=53(y1), r2=86(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 53
LDI r2, 86
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
