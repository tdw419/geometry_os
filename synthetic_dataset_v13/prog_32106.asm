; DESCRIPTION: Draws a white line from (404, 159) to (2, 165).
; PLAN: r0=404(x1), r1=159(y1), r2=2(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 159
LDI r2, 2
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
