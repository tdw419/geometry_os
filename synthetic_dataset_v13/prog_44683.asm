; DESCRIPTION: Draws a magenta line from (136, 72) to (257, 221).
; PLAN: r0=136(x1), r1=72(y1), r2=257(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 72
LDI r2, 257
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
