; DESCRIPTION: Draws a magenta line from (134, 208) to (63, 254).
; PLAN: r0=134(x1), r1=208(y1), r2=63(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 208
LDI r2, 63
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
