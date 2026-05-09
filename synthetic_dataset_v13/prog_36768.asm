; DESCRIPTION: Draws a yellow line from (296, 77) to (413, 21).
; PLAN: r0=296(x1), r1=77(y1), r2=413(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 77
LDI r2, 413
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
