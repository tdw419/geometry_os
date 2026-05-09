; DESCRIPTION: Draws a magenta line from (309, 57) to (41, 63).
; PLAN: r0=309(x1), r1=57(y1), r2=41(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 57
LDI r2, 41
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
