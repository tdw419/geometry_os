; DESCRIPTION: Draws a yellow line from (231, 155) to (131, 180).
; PLAN: r0=231(x1), r1=155(y1), r2=131(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 155
LDI r2, 131
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
