; DESCRIPTION: Draws a white line from (414, 113) to (212, 68).
; PLAN: r0=414(x1), r1=113(y1), r2=212(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 113
LDI r2, 212
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
