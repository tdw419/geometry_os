; DESCRIPTION: Draws a magenta line from (278, 27) to (97, 118).
; PLAN: r0=278(x1), r1=27(y1), r2=97(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 27
LDI r2, 97
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
