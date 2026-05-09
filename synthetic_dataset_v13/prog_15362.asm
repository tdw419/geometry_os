; DESCRIPTION: Draws a orange line from (256, 62) to (174, 63).
; PLAN: r0=256(x1), r1=62(y1), r2=174(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 62
LDI r2, 174
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
