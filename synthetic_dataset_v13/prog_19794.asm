; DESCRIPTION: Draws a red line from (26, 113) to (192, 43).
; PLAN: r0=26(x1), r1=113(y1), r2=192(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 113
LDI r2, 192
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
