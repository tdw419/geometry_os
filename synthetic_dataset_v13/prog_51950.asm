; DESCRIPTION: Draws a orange line from (267, 34) to (326, 34).
; PLAN: r0=267(x1), r1=34(y1), r2=326(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 34
LDI r2, 326
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
