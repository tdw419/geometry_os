; DESCRIPTION: Draws a green line from (83, 123) to (94, 101).
; PLAN: r0=83(x1), r1=123(y1), r2=94(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 123
LDI r2, 94
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
