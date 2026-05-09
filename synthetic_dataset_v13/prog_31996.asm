; DESCRIPTION: Composite: Sets a single white pixel at (494, 77) then Places a blue line segment connecting (278, 44) to (496, 163).
; PLAN: r0=494(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=278(x1), r6=44(y1), r7=496(x2), r8=163(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 494
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 44
LDI r7, 496
LDI r8, 163
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
