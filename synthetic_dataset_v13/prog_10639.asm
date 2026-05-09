; DESCRIPTION: Draws a yellow line from (263, 204) to (153, 139).
; PLAN: r0=263(x1), r1=204(y1), r2=153(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 204
LDI r2, 153
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
