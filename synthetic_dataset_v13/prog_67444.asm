; DESCRIPTION: Draws a orange line from (433, 254) to (406, 138).
; PLAN: r0=433(x1), r1=254(y1), r2=406(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 254
LDI r2, 406
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
