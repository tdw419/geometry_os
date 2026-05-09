; DESCRIPTION: Draws a magenta line from (203, 114) to (232, 150).
; PLAN: r0=203(x1), r1=114(y1), r2=232(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 114
LDI r2, 232
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
