; DESCRIPTION: Draws a green line from (162, 225) to (351, 139).
; PLAN: r0=162(x1), r1=225(y1), r2=351(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 225
LDI r2, 351
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
