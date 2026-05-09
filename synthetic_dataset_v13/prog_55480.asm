; DESCRIPTION: Draws a orange line from (239, 233) to (104, 105).
; PLAN: r0=239(x1), r1=233(y1), r2=104(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 233
LDI r2, 104
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
