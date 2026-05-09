; DESCRIPTION: Draws a magenta line from (2, 30) to (231, 223).
; PLAN: r0=2(x1), r1=30(y1), r2=231(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 30
LDI r2, 231
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
