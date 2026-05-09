; DESCRIPTION: Draws a magenta line from (110, 33) to (431, 101).
; PLAN: r0=110(x1), r1=33(y1), r2=431(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 33
LDI r2, 431
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
