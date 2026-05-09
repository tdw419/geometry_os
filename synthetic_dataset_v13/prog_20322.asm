; DESCRIPTION: Draws a magenta line from (203, 236) to (421, 106).
; PLAN: r0=203(x1), r1=236(y1), r2=421(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 236
LDI r2, 421
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
