; DESCRIPTION: Draws a magenta line from (246, 237) to (269, 63).
; PLAN: r0=246(x1), r1=237(y1), r2=269(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 237
LDI r2, 269
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
