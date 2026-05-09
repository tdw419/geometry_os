; DESCRIPTION: Draws a orange line from (352, 52) to (272, 221).
; PLAN: r0=352(x1), r1=52(y1), r2=272(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 52
LDI r2, 272
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
