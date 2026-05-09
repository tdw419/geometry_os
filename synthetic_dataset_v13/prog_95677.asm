; DESCRIPTION: Draws a yellow line from (341, 231) to (339, 142).
; PLAN: r0=341(x1), r1=231(y1), r2=339(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 231
LDI r2, 339
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
