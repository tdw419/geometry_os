; DESCRIPTION: Draws a green line from (3, 147) to (195, 45).
; PLAN: r0=3(x1), r1=147(y1), r2=195(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 147
LDI r2, 195
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
