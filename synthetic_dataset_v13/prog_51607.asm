; DESCRIPTION: Draws a magenta line from (343, 108) to (195, 236).
; PLAN: r0=343(x1), r1=108(y1), r2=195(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 108
LDI r2, 195
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
