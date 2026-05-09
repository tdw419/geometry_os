; DESCRIPTION: Places a yellow line segment connecting (88, 183) to (242, 190).
; PLAN: r0=88(x1), r1=183(y1), r2=242(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 183
LDI r2, 242
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
