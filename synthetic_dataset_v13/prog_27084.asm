; DESCRIPTION: Draws a magenta line from (28, 77) to (279, 203).
; PLAN: r0=28(x1), r1=77(y1), r2=279(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 77
LDI r2, 279
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
