; DESCRIPTION: Draws a yellow line from (116, 166) to (331, 216).
; PLAN: r0=116(x1), r1=166(y1), r2=331(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 166
LDI r2, 331
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
