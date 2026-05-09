; DESCRIPTION: Draws a yellow line from (341, 249) to (269, 163).
; PLAN: r0=341(x1), r1=249(y1), r2=269(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 249
LDI r2, 269
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
