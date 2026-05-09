; DESCRIPTION: Draws a magenta line from (395, 226) to (159, 41).
; PLAN: r0=395(x1), r1=226(y1), r2=159(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 226
LDI r2, 159
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
