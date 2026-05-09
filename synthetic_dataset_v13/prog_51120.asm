; DESCRIPTION: Draws a orange line from (203, 215) to (14, 54).
; PLAN: r0=203(x1), r1=215(y1), r2=14(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 215
LDI r2, 14
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
