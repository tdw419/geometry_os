; DESCRIPTION: Draws a magenta line from (349, 236) to (156, 211).
; PLAN: r0=349(x1), r1=236(y1), r2=156(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 236
LDI r2, 156
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
