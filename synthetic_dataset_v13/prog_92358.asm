; DESCRIPTION: Draws a magenta line from (157, 7) to (91, 137).
; PLAN: r0=157(x1), r1=7(y1), r2=91(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 7
LDI r2, 91
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
