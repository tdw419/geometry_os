; DESCRIPTION: Draws a magenta line from (194, 21) to (13, 226).
; PLAN: r0=194(x1), r1=21(y1), r2=13(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 21
LDI r2, 13
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
