; DESCRIPTION: Draws a blue line from (319, 201) to (36, 59).
; PLAN: r0=319(x1), r1=201(y1), r2=36(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 201
LDI r2, 36
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
