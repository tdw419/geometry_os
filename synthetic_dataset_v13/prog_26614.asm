; DESCRIPTION: Draws a orange line from (174, 182) to (299, 197).
; PLAN: r0=174(x1), r1=182(y1), r2=299(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 182
LDI r2, 299
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
