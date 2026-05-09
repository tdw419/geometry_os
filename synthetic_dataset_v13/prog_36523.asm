; DESCRIPTION: Draws a orange line from (177, 134) to (107, 239).
; PLAN: r0=177(x1), r1=134(y1), r2=107(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 134
LDI r2, 107
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
