; DESCRIPTION: Draws a green line from (287, 147) to (35, 64).
; PLAN: r0=287(x1), r1=147(y1), r2=35(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 147
LDI r2, 35
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
