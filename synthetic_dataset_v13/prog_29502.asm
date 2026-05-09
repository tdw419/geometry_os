; DESCRIPTION: Draws a magenta line from (310, 153) to (13, 87).
; PLAN: r0=310(x1), r1=153(y1), r2=13(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 153
LDI r2, 13
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
