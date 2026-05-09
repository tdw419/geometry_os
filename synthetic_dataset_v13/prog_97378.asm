; DESCRIPTION: Draws a green line from (273, 157) to (316, 159).
; PLAN: r0=273(x1), r1=157(y1), r2=316(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 157
LDI r2, 316
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
