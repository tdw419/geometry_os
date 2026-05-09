; DESCRIPTION: Draws a blue line from (274, 254) to (428, 222).
; PLAN: r0=274(x1), r1=254(y1), r2=428(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 254
LDI r2, 428
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
