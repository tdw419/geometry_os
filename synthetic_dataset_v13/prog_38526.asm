; DESCRIPTION: Draws a yellow line from (199, 58) to (68, 43).
; PLAN: r0=199(x1), r1=58(y1), r2=68(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 58
LDI r2, 68
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
