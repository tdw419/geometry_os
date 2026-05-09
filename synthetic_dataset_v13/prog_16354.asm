; DESCRIPTION: Draws a green line from (339, 207) to (101, 46).
; PLAN: r0=339(x1), r1=207(y1), r2=101(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 207
LDI r2, 101
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
