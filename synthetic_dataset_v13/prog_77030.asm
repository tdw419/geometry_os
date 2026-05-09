; DESCRIPTION: Draws a yellow line from (503, 81) to (49, 139).
; PLAN: r0=503(x1), r1=81(y1), r2=49(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 81
LDI r2, 49
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
