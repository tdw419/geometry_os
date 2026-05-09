; DESCRIPTION: Draws a magenta line from (184, 164) to (363, 159).
; PLAN: r0=184(x1), r1=164(y1), r2=363(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 164
LDI r2, 363
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
