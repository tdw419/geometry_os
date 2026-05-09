; DESCRIPTION: Draws a orange line from (17, 68) to (346, 78).
; PLAN: r0=17(x1), r1=68(y1), r2=346(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 68
LDI r2, 346
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
