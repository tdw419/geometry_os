; DESCRIPTION: Draws a magenta line from (307, 222) to (257, 203).
; PLAN: r0=307(x1), r1=222(y1), r2=257(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 222
LDI r2, 257
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
