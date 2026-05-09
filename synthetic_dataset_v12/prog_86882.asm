; DESCRIPTION: Draws a purple line from (330, 176) to (257, 69).
; PLAN: r0=330(x1), r1=176(y1), r2=257(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 176
LDI r2, 257
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
