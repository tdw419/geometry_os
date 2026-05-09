; DESCRIPTION: Draws a green line from (244, 147) to (350, 5).
; PLAN: r0=244(x1), r1=147(y1), r2=350(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 147
LDI r2, 350
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
