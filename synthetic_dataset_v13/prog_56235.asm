; DESCRIPTION: Draws a yellow line from (274, 170) to (350, 53).
; PLAN: r0=274(x1), r1=170(y1), r2=350(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 170
LDI r2, 350
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
