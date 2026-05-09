; DESCRIPTION: Draws a yellow line from (249, 71) to (63, 41).
; PLAN: r0=249(x1), r1=71(y1), r2=63(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 71
LDI r2, 63
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
