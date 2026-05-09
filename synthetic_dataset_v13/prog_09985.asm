; DESCRIPTION: Draws a magenta line from (236, 134) to (31, 234).
; PLAN: r0=236(x1), r1=134(y1), r2=31(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 134
LDI r2, 31
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
