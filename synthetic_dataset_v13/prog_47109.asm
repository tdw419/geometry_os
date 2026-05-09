; DESCRIPTION: Draws a orange line from (233, 186) to (74, 7).
; PLAN: r0=233(x1), r1=186(y1), r2=74(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 186
LDI r2, 74
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
