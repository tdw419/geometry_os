; DESCRIPTION: Draws a magenta line from (13, 58) to (285, 145).
; PLAN: r0=13(x1), r1=58(y1), r2=285(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 58
LDI r2, 285
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
