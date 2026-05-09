; DESCRIPTION: Draws a yellow line from (389, 157) to (231, 20).
; PLAN: r0=389(x1), r1=157(y1), r2=231(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 157
LDI r2, 231
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
