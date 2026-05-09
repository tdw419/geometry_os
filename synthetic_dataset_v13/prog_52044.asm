; DESCRIPTION: Draws a magenta line from (484, 134) to (459, 48).
; PLAN: r0=484(x1), r1=134(y1), r2=459(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 134
LDI r2, 459
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
