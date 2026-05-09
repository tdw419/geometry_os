; DESCRIPTION: Draws a red line from (331, 78) to (296, 150).
; PLAN: r0=331(x1), r1=78(y1), r2=296(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 78
LDI r2, 296
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
