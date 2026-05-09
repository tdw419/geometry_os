; DESCRIPTION: Draws a yellow line from (181, 126) to (63, 9).
; PLAN: r0=181(x1), r1=126(y1), r2=63(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 126
LDI r2, 63
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
