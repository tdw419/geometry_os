; DESCRIPTION: Composite: Draws a blue circle centered at (381, 112) with radius 77 then Draws a black line from (257, 7) to (38, 53).
; PLAN: r0=381(x), r1=112(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x1), r6=7(y1), r7=38(x2), r8=53(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 112
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 7
LDI r7, 38
LDI r8, 53
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
