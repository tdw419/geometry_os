; DESCRIPTION: Draws a green line from (325, 62) to (366, 31).
; PLAN: r0=325(x1), r1=62(y1), r2=366(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 62
LDI r2, 366
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
