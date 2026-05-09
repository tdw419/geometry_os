; DESCRIPTION: Draws a orange line from (299, 192) to (334, 186).
; PLAN: r0=299(x1), r1=192(y1), r2=334(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 192
LDI r2, 334
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
