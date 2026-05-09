; DESCRIPTION: Draws a orange line from (416, 67) to (239, 157).
; PLAN: r0=416(x1), r1=67(y1), r2=239(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 67
LDI r2, 239
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
