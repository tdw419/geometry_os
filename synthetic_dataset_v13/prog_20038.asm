; DESCRIPTION: Composite: Sets a single white pixel at (165, 77) then Draws a blue line from (172, 102) to (233, 227).
; PLAN: r0=165(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=172(x1), r6=102(y1), r7=233(x2), r8=227(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 172
LDI r6, 102
LDI r7, 233
LDI r8, 227
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
