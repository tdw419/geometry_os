; DESCRIPTION: Draws a yellow line from (366, 241) to (423, 128).
; PLAN: r0=366(x1), r1=241(y1), r2=423(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 241
LDI r2, 423
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
