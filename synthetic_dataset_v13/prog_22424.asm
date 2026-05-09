; DESCRIPTION: Draws a yellow line from (12, 6) to (347, 139).
; PLAN: r0=12(x1), r1=6(y1), r2=347(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 6
LDI r2, 347
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
