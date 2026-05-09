; DESCRIPTION: Draws a yellow line from (388, 208) to (112, 0).
; PLAN: r0=388(x1), r1=208(y1), r2=112(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 208
LDI r2, 112
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
