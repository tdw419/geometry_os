; DESCRIPTION: Draws a orange line from (107, 234) to (42, 43).
; PLAN: r0=107(x1), r1=234(y1), r2=42(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 234
LDI r2, 42
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
