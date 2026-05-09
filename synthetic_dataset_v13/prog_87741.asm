; DESCRIPTION: Composite: Draws a white line from (142, 216) to (141, 135) then Sets a single magenta pixel at (58, 129).
; PLAN: r0=142(x1), r1=216(y1), r2=141(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=58(x), r6=129(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 142
LDI r1, 216
LDI r2, 141
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 129
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
