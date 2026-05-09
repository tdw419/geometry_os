; DESCRIPTION: Draws a orange line from (36, 79) to (199, 111).
; PLAN: r0=36(x1), r1=79(y1), r2=199(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 79
LDI r2, 199
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
