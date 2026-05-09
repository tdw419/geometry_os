; DESCRIPTION: Draws a orange line from (186, 6) to (499, 111).
; PLAN: r0=186(x1), r1=6(y1), r2=499(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 6
LDI r2, 499
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
