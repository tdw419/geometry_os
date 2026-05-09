; DESCRIPTION: Draws a orange line from (265, 50) to (27, 25).
; PLAN: r0=265(x1), r1=50(y1), r2=27(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 50
LDI r2, 27
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
