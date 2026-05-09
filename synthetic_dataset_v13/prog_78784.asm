; DESCRIPTION: Draws a yellow line from (34, 13) to (189, 104).
; PLAN: r0=34(x1), r1=13(y1), r2=189(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 13
LDI r2, 189
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
