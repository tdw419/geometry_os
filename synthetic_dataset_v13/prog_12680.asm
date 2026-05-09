; DESCRIPTION: Draws a magenta line from (393, 1) to (453, 74).
; PLAN: r0=393(x1), r1=1(y1), r2=453(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 1
LDI r2, 453
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
