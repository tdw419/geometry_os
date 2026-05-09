; DESCRIPTION: Draws a magenta line from (327, 169) to (113, 232).
; PLAN: r0=327(x1), r1=169(y1), r2=113(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 169
LDI r2, 113
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
