; DESCRIPTION: Draws a green line from (258, 147) to (111, 85).
; PLAN: r0=258(x1), r1=147(y1), r2=111(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 147
LDI r2, 111
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
