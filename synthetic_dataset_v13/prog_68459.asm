; DESCRIPTION: Places a yellow line segment connecting (412, 99) to (233, 190).
; PLAN: r0=412(x1), r1=99(y1), r2=233(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 99
LDI r2, 233
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
