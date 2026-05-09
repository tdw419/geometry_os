; DESCRIPTION: Draws a yellow line from (427, 63) to (68, 113).
; PLAN: r0=427(x1), r1=63(y1), r2=68(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 63
LDI r2, 68
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
