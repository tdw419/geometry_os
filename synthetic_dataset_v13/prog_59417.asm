; DESCRIPTION: Draws a green line from (386, 136) to (325, 150).
; PLAN: r0=386(x1), r1=136(y1), r2=325(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 136
LDI r2, 325
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
