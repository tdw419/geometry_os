; DESCRIPTION: Draws a orange line from (273, 228) to (493, 41).
; PLAN: r0=273(x1), r1=228(y1), r2=493(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 228
LDI r2, 493
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
