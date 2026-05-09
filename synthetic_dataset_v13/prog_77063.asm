; DESCRIPTION: Draws a magenta line from (352, 141) to (100, 41).
; PLAN: r0=352(x1), r1=141(y1), r2=100(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 141
LDI r2, 100
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
