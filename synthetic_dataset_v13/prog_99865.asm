; DESCRIPTION: Composite: Draws a black line from (100, 131) to (436, 132) then Creates a red circular shape at (217, 135) with radius 49.
; PLAN: r0=100(x1), r1=131(y1), r2=436(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=135(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 100
LDI r1, 131
LDI r2, 436
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 135
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
