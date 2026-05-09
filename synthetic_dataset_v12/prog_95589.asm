; DESCRIPTION: Draws a orange line from (63, 74) to (174, 241).
; PLAN: r0=63(x1), r1=74(y1), r2=174(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 74
LDI r2, 174
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
