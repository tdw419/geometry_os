; DESCRIPTION: Draws a magenta line from (40, 160) to (130, 73).
; PLAN: r0=40(x1), r1=160(y1), r2=130(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 160
LDI r2, 130
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
