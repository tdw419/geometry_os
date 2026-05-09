; DESCRIPTION: Draws a yellow line from (399, 117) to (139, 20).
; PLAN: r0=399(x1), r1=117(y1), r2=139(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 117
LDI r2, 139
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
