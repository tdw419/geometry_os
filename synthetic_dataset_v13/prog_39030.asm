; DESCRIPTION: Places a yellow line segment connecting (81, 190) to (465, 9).
; PLAN: r0=81(x1), r1=190(y1), r2=465(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 190
LDI r2, 465
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
