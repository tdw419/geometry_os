; DESCRIPTION: Draws a orange line from (460, 158) to (139, 186).
; PLAN: r0=460(x1), r1=158(y1), r2=139(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 158
LDI r2, 139
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
