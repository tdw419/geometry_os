; DESCRIPTION: Draws a magenta line from (63, 208) to (188, 134).
; PLAN: r0=63(x1), r1=208(y1), r2=188(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 208
LDI r2, 188
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
