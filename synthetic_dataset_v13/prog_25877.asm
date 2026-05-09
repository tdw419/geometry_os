; DESCRIPTION: Draws a yellow line from (151, 70) to (274, 106).
; PLAN: r0=151(x1), r1=70(y1), r2=274(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 70
LDI r2, 274
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
