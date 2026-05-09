; DESCRIPTION: Draws a yellow line from (150, 41) to (431, 36).
; PLAN: r0=150(x1), r1=41(y1), r2=431(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 41
LDI r2, 431
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
