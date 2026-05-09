; DESCRIPTION: Draws a magenta line from (453, 120) to (459, 123).
; PLAN: r0=453(x1), r1=120(y1), r2=459(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 120
LDI r2, 459
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
