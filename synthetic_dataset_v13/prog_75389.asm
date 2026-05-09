; DESCRIPTION: Places a yellow line segment connecting (465, 158) to (304, 126).
; PLAN: r0=465(x1), r1=158(y1), r2=304(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 158
LDI r2, 304
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
