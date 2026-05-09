; DESCRIPTION: Draws a orange line from (215, 24) to (184, 176).
; PLAN: r0=215(x1), r1=24(y1), r2=184(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 24
LDI r2, 184
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
