; DESCRIPTION: Composite: Draws a white line from (418, 73) to (14, 55) then Sets a single white pixel at (144, 57).
; PLAN: r0=418(x1), r1=73(y1), r2=14(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=57(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 418
LDI r1, 73
LDI r2, 14
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 57
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
