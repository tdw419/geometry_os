; DESCRIPTION: Composite: Places a white line segment connecting (343, 179) to (164, 43) then Draws a white circle centered at (178, 177) with radius 72.
; PLAN: r0=343(x1), r1=179(y1), r2=164(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=177(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 343
LDI r1, 179
LDI r2, 164
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 177
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
