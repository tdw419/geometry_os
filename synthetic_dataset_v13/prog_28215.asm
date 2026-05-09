; DESCRIPTION: Draws a yellow line from (116, 104) to (185, 7).
; PLAN: r0=116(x1), r1=104(y1), r2=185(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 104
LDI r2, 185
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
