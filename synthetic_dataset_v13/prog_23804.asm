; DESCRIPTION: Composite: Draws a black line from (175, 31) to (19, 3) then Sets a single white pixel at (51, 129).
; PLAN: r0=175(x1), r1=31(y1), r2=19(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=129(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 31
LDI r2, 19
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 129
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
