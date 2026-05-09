; DESCRIPTION: Draws a yellow line from (214, 139) to (129, 1).
; PLAN: r0=214(x1), r1=139(y1), r2=129(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 139
LDI r2, 129
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
