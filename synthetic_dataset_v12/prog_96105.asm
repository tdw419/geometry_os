; DESCRIPTION: Draws a yellow line from (269, 196) to (316, 85).
; PLAN: r0=269(x1), r1=196(y1), r2=316(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 196
LDI r2, 316
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
