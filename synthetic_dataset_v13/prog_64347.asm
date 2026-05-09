; DESCRIPTION: Draws a yellow line from (468, 172) to (78, 251).
; PLAN: r0=468(x1), r1=172(y1), r2=78(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 172
LDI r2, 78
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
