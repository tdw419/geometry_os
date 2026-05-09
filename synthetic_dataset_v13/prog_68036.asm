; DESCRIPTION: Draws a red line from (296, 237) to (36, 229).
; PLAN: r0=296(x1), r1=237(y1), r2=36(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 237
LDI r2, 36
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
