; DESCRIPTION: Draws a magenta line from (457, 41) to (30, 62).
; PLAN: r0=457(x1), r1=41(y1), r2=30(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 41
LDI r2, 30
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
