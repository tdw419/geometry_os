; DESCRIPTION: Draws a blue line from (231, 179) to (387, 205).
; PLAN: r0=231(x1), r1=179(y1), r2=387(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 179
LDI r2, 387
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
