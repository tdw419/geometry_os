; DESCRIPTION: Draws a magenta line from (273, 0) to (73, 2).
; PLAN: r0=273(x1), r1=0(y1), r2=73(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 0
LDI r2, 73
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
