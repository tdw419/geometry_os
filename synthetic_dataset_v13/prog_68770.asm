; DESCRIPTION: Draws a orange line from (195, 142) to (37, 210).
; PLAN: r0=195(x1), r1=142(y1), r2=37(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 142
LDI r2, 37
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
