; DESCRIPTION: Draws a yellow line from (139, 225) to (511, 176).
; PLAN: r0=139(x1), r1=225(y1), r2=511(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 225
LDI r2, 511
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
