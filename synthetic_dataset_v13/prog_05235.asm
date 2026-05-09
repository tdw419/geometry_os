; DESCRIPTION: Draws a yellow line from (414, 40) to (466, 18).
; PLAN: r0=414(x1), r1=40(y1), r2=466(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 40
LDI r2, 466
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
