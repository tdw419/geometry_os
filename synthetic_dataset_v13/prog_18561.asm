; DESCRIPTION: Draws a orange line from (215, 106) to (265, 98).
; PLAN: r0=215(x1), r1=106(y1), r2=265(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 106
LDI r2, 265
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
