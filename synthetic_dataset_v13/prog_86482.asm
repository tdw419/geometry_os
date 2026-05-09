; DESCRIPTION: Draws a green line from (124, 72) to (451, 183).
; PLAN: r0=124(x1), r1=72(y1), r2=451(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 72
LDI r2, 451
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
