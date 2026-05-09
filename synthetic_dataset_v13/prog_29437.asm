; DESCRIPTION: Draws a orange line from (228, 13) to (404, 176).
; PLAN: r0=228(x1), r1=13(y1), r2=404(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 13
LDI r2, 404
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
