; DESCRIPTION: Draws a magenta line from (145, 172) to (272, 75).
; PLAN: r0=145(x1), r1=172(y1), r2=272(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 172
LDI r2, 272
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
