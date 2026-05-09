; DESCRIPTION: Draws a white line from (492, 247) to (296, 203).
; PLAN: r0=492(x1), r1=247(y1), r2=296(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 247
LDI r2, 296
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
