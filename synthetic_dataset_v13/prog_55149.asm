; DESCRIPTION: Draws a magenta line from (41, 219) to (324, 103).
; PLAN: r0=41(x1), r1=219(y1), r2=324(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 219
LDI r2, 324
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
