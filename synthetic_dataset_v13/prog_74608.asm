; DESCRIPTION: Draws a magenta line from (108, 211) to (257, 182).
; PLAN: r0=108(x1), r1=211(y1), r2=257(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 211
LDI r2, 257
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
