; DESCRIPTION: Draws a green line from (312, 104) to (426, 139).
; PLAN: r0=312(x1), r1=104(y1), r2=426(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 104
LDI r2, 426
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
