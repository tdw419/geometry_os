; DESCRIPTION: Composite: Places a white dot at position (447, 227) then Draws a white line from (397, 17) to (498, 153).
; PLAN: r0=447(x), r1=227(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=397(x1), r6=17(y1), r7=498(x2), r8=153(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 227
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 397
LDI r6, 17
LDI r7, 498
LDI r8, 153
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
