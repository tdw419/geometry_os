; DESCRIPTION: Draws a yellow line from (274, 116) to (368, 13).
; PLAN: r0=274(x1), r1=116(y1), r2=368(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 116
LDI r2, 368
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
