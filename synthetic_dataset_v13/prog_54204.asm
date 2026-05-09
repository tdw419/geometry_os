; DESCRIPTION: Draws a magenta line from (388, 3) to (63, 225).
; PLAN: r0=388(x1), r1=3(y1), r2=63(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 3
LDI r2, 63
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
