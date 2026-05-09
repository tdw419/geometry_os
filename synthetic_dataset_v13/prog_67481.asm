; DESCRIPTION: Draws a yellow line from (406, 98) to (37, 139).
; PLAN: r0=406(x1), r1=98(y1), r2=37(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 98
LDI r2, 37
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
