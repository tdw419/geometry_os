; DESCRIPTION: Composite: Draws a black circle centered at (428, 121) with radius 71 then Places a black line segment connecting (325, 15) to (263, 135).
; PLAN: r0=428(x), r1=121(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x1), r6=15(y1), r7=263(x2), r8=135(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 121
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 15
LDI r7, 263
LDI r8, 135
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
