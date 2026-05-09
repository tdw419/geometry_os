; DESCRIPTION: Draws a orange line from (352, 205) to (66, 79).
; PLAN: r0=352(x1), r1=205(y1), r2=66(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 205
LDI r2, 66
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
