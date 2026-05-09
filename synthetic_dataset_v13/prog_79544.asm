; DESCRIPTION: Draws a yellow line from (36, 76) to (199, 97).
; PLAN: r0=36(x1), r1=76(y1), r2=199(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 76
LDI r2, 199
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
