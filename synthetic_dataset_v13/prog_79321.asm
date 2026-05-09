; DESCRIPTION: Composite: Renders a purple line between points (282, 111) and (31, 39) then Sets a single white pixel at (121, 93).
; PLAN: r0=282(x1), r1=111(y1), r2=31(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=93(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 282
LDI r1, 111
LDI r2, 31
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 93
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
