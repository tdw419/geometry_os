; DESCRIPTION: Draws a white line from (172, 123) to (404, 93).
; PLAN: r0=172(x1), r1=123(y1), r2=404(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 123
LDI r2, 404
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
