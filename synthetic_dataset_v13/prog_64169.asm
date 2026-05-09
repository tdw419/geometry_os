; DESCRIPTION: Draws a magenta line from (130, 141) to (125, 0).
; PLAN: r0=130(x1), r1=141(y1), r2=125(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 141
LDI r2, 125
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
