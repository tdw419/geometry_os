; DESCRIPTION: Draws a orange line from (431, 228) to (309, 241).
; PLAN: r0=431(x1), r1=228(y1), r2=309(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 228
LDI r2, 309
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
