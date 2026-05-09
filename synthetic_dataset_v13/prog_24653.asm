; DESCRIPTION: Draws a yellow line from (322, 84) to (230, 139).
; PLAN: r0=322(x1), r1=84(y1), r2=230(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 84
LDI r2, 230
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
