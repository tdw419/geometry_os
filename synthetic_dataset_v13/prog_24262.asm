; DESCRIPTION: Draws a magenta line from (184, 177) to (137, 246).
; PLAN: r0=184(x1), r1=177(y1), r2=137(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 177
LDI r2, 137
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
