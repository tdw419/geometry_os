; DESCRIPTION: Draws a orange line from (103, 86) to (229, 71).
; PLAN: r0=103(x1), r1=86(y1), r2=229(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 86
LDI r2, 229
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
