; DESCRIPTION: Draws a black line from (6, 80) to (471, 204).
; PLAN: r0=6(x1), r1=80(y1), r2=471(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 80
LDI r2, 471
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
