; DESCRIPTION: Draws a yellow line from (137, 52) to (67, 46).
; PLAN: r0=137(x1), r1=52(y1), r2=67(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 52
LDI r2, 67
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
