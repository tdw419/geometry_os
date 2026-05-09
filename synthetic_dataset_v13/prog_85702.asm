; DESCRIPTION: Draws a orange line from (352, 254) to (16, 66).
; PLAN: r0=352(x1), r1=254(y1), r2=16(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 254
LDI r2, 16
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
