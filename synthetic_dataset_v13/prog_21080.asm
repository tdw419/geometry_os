; DESCRIPTION: Draws a magenta line from (166, 56) to (144, 153).
; PLAN: r0=166(x1), r1=56(y1), r2=144(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 56
LDI r2, 144
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
