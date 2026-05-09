; DESCRIPTION: Composite: Renders a white line between points (274, 28) and (119, 198) then Sets a single white pixel at (174, 233).
; PLAN: r0=274(x1), r1=28(y1), r2=119(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=233(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 274
LDI r1, 28
LDI r2, 119
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 233
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
