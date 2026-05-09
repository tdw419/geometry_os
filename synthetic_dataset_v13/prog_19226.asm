; DESCRIPTION: Draws a orange line from (14, 110) to (304, 27).
; PLAN: r0=14(x1), r1=110(y1), r2=304(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 110
LDI r2, 304
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
