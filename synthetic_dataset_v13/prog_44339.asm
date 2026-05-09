; DESCRIPTION: Draws a magenta line from (375, 179) to (231, 128).
; PLAN: r0=375(x1), r1=179(y1), r2=231(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 179
LDI r2, 231
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
