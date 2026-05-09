; DESCRIPTION: Draws a orange line from (126, 61) to (306, 73).
; PLAN: r0=126(x1), r1=61(y1), r2=306(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 61
LDI r2, 306
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
