; DESCRIPTION: Draws a red line from (406, 10) to (283, 211).
; PLAN: r0=406(x1), r1=10(y1), r2=283(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 10
LDI r2, 283
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
