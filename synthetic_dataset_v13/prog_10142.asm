; DESCRIPTION: Draws a red line from (409, 90) to (508, 247).
; PLAN: r0=409(x1), r1=90(y1), r2=508(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 90
LDI r2, 508
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
