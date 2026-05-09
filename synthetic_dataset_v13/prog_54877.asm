; DESCRIPTION: Draws a yellow line from (77, 111) to (148, 200).
; PLAN: r0=77(x1), r1=111(y1), r2=148(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 111
LDI r2, 148
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
