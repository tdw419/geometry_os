; DESCRIPTION: Draws a orange line from (239, 231) to (459, 6).
; PLAN: r0=239(x1), r1=231(y1), r2=459(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 231
LDI r2, 459
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
