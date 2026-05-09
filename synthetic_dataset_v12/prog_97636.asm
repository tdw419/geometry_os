; DESCRIPTION: Draws a yellow line from (216, 92) to (246, 192).
; PLAN: r0=216(x1), r1=92(y1), r2=246(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 92
LDI r2, 246
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
