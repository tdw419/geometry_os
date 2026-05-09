; DESCRIPTION: Draws a magenta line from (41, 246) to (243, 81).
; PLAN: r0=41(x1), r1=246(y1), r2=243(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 246
LDI r2, 243
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
