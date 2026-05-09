; DESCRIPTION: Draws a red line from (296, 17) to (172, 207).
; PLAN: r0=296(x1), r1=17(y1), r2=172(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 17
LDI r2, 172
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
