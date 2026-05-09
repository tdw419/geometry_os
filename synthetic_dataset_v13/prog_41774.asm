; DESCRIPTION: Draws a magenta line from (385, 203) to (19, 47).
; PLAN: r0=385(x1), r1=203(y1), r2=19(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 203
LDI r2, 19
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
