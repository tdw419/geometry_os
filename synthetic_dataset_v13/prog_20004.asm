; DESCRIPTION: Draws a orange line from (312, 239) to (482, 33).
; PLAN: r0=312(x1), r1=239(y1), r2=482(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 239
LDI r2, 482
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
