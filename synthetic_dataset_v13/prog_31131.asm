; DESCRIPTION: Draws a yellow line from (373, 88) to (43, 44).
; PLAN: r0=373(x1), r1=88(y1), r2=43(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 88
LDI r2, 43
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
