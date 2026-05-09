; DESCRIPTION: Draws a magenta line from (147, 194) to (128, 249).
; PLAN: r0=147(x1), r1=194(y1), r2=128(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 194
LDI r2, 128
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
