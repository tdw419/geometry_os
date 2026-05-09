; DESCRIPTION: Draws a orange line from (430, 168) to (90, 178).
; PLAN: r0=430(x1), r1=168(y1), r2=90(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 168
LDI r2, 90
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
