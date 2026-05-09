; DESCRIPTION: Draws a orange line from (122, 183) to (344, 107).
; PLAN: r0=122(x1), r1=183(y1), r2=344(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 183
LDI r2, 344
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
