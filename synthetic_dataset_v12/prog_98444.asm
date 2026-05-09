; DESCRIPTION: Renders a orange line between points (137, 2) and (281, 206).
; PLAN: r0=137(x1), r1=2(y1), r2=281(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 2
LDI r2, 281
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
