; DESCRIPTION: Draws a orange line from (425, 159) to (174, 157).
; PLAN: r0=425(x1), r1=159(y1), r2=174(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 159
LDI r2, 174
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
