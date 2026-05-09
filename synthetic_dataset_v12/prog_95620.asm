; DESCRIPTION: Draws a orange line from (352, 186) to (47, 192).
; PLAN: r0=352(x1), r1=186(y1), r2=47(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 186
LDI r2, 47
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
