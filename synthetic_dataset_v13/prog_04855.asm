; DESCRIPTION: Composite: Sets a single white pixel at (310, 142) then Draws a black line from (421, 160) to (262, 100).
; PLAN: r0=310(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=421(x1), r6=160(y1), r7=262(x2), r8=100(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 142
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 421
LDI r6, 160
LDI r7, 262
LDI r8, 100
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
