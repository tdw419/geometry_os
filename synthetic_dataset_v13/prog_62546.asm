; DESCRIPTION: Draws a magenta line from (110, 155) to (111, 222).
; PLAN: r0=110(x1), r1=155(y1), r2=111(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 155
LDI r2, 111
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
