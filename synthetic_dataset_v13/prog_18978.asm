; DESCRIPTION: Draws a yellow line from (325, 15) to (282, 220).
; PLAN: r0=325(x1), r1=15(y1), r2=282(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 15
LDI r2, 282
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
