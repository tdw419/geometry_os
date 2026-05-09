; DESCRIPTION: Draws a magenta line from (262, 35) to (130, 0).
; PLAN: r0=262(x1), r1=35(y1), r2=130(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 35
LDI r2, 130
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
