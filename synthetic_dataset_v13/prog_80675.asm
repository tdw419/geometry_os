; DESCRIPTION: Draws a yellow line from (368, 207) to (56, 62).
; PLAN: r0=368(x1), r1=207(y1), r2=56(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 207
LDI r2, 56
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
