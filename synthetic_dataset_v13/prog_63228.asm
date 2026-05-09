; DESCRIPTION: Composite: Renders a red disk with center (368, 143) and radius 15 then Draws a white line from (343, 2) to (421, 121).
; PLAN: r0=368(x), r1=143(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x1), r6=2(y1), r7=421(x2), r8=121(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 143
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 2
LDI r7, 421
LDI r8, 121
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
