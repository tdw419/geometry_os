; DESCRIPTION: Draws a magenta line from (272, 144) to (300, 135).
; PLAN: r0=272(x1), r1=144(y1), r2=300(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 144
LDI r2, 300
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
