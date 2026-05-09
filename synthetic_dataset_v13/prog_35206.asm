; DESCRIPTION: Draws a white line from (404, 155) to (370, 254).
; PLAN: r0=404(x1), r1=155(y1), r2=370(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 155
LDI r2, 370
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
