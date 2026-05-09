; DESCRIPTION: Draws a magenta line from (427, 198) to (46, 86).
; PLAN: r0=427(x1), r1=198(y1), r2=46(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 198
LDI r2, 46
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
