; DESCRIPTION: Draws a green line from (509, 201) to (314, 175).
; PLAN: r0=509(x1), r1=201(y1), r2=314(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 201
LDI r2, 314
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
