; DESCRIPTION: Draws a magenta line from (58, 155) to (123, 225).
; PLAN: r0=58(x1), r1=155(y1), r2=123(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 155
LDI r2, 123
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
