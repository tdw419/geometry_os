; DESCRIPTION: Draws a magenta line from (326, 226) to (91, 41).
; PLAN: r0=326(x1), r1=226(y1), r2=91(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 226
LDI r2, 91
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
