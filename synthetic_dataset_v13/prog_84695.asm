; DESCRIPTION: Draws a magenta line from (272, 151) to (207, 101).
; PLAN: r0=272(x1), r1=151(y1), r2=207(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 151
LDI r2, 207
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
