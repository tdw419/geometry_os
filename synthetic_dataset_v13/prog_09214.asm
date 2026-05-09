; DESCRIPTION: Draws a yellow line from (131, 96) to (114, 205).
; PLAN: r0=131(x1), r1=96(y1), r2=114(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 96
LDI r2, 114
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
