; DESCRIPTION: Draws a yellow line from (190, 227) to (92, 222).
; PLAN: r0=190(x1), r1=227(y1), r2=92(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 227
LDI r2, 92
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
