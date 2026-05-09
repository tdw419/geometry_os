; DESCRIPTION: Draws a orange line from (239, 83) to (283, 195).
; PLAN: r0=239(x1), r1=83(y1), r2=283(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 83
LDI r2, 283
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
