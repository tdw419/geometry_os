; DESCRIPTION: Draws a orange line from (254, 128) to (195, 230).
; PLAN: r0=254(x1), r1=128(y1), r2=195(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 128
LDI r2, 195
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
