; DESCRIPTION: Draws a orange line from (237, 157) to (265, 159).
; PLAN: r0=237(x1), r1=157(y1), r2=265(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 157
LDI r2, 265
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
