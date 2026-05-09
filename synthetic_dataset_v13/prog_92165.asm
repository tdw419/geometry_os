; DESCRIPTION: Draws a yellow line from (274, 201) to (113, 3).
; PLAN: r0=274(x1), r1=201(y1), r2=113(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 201
LDI r2, 113
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
