; DESCRIPTION: Draws a orange line from (282, 93) to (438, 20).
; PLAN: r0=282(x1), r1=93(y1), r2=438(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 93
LDI r2, 438
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
