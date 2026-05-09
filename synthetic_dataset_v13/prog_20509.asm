; DESCRIPTION: Draws a orange line from (122, 5) to (367, 192).
; PLAN: r0=122(x1), r1=5(y1), r2=367(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 5
LDI r2, 367
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
