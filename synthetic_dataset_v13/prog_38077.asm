; DESCRIPTION: Draws a yellow line from (498, 10) to (457, 78).
; PLAN: r0=498(x1), r1=10(y1), r2=457(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 10
LDI r2, 457
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
