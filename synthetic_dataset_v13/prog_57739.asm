; DESCRIPTION: Draws a magenta line from (151, 72) to (453, 5).
; PLAN: r0=151(x1), r1=72(y1), r2=453(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 72
LDI r2, 453
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
