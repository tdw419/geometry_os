; DESCRIPTION: Draws a orange line from (168, 53) to (429, 17).
; PLAN: r0=168(x1), r1=53(y1), r2=429(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 53
LDI r2, 429
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
