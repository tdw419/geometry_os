; DESCRIPTION: Draws a orange line from (199, 182) to (304, 12).
; PLAN: r0=199(x1), r1=182(y1), r2=304(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 182
LDI r2, 304
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
