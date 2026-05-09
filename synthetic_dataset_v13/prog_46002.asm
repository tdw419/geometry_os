; DESCRIPTION: Draws a orange line from (144, 134) to (130, 156).
; PLAN: r0=144(x1), r1=134(y1), r2=130(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 134
LDI r2, 130
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
