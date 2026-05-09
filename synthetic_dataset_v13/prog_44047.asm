; DESCRIPTION: Draws a orange line from (332, 147) to (195, 125).
; PLAN: r0=332(x1), r1=147(y1), r2=195(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 147
LDI r2, 195
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
