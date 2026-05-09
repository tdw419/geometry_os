; DESCRIPTION: Draws a blue line from (376, 207) to (326, 47).
; PLAN: r0=376(x1), r1=207(y1), r2=326(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 207
LDI r2, 326
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
