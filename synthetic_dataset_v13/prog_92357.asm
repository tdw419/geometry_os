; DESCRIPTION: Composite: Draws a white circle centered at (199, 124) with radius 15 then Places a purple line segment connecting (247, 5) to (109, 41) then Places a magenta dot at position (436, 219).
; PLAN: r0=199(x), r1=124(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x1), r6=5(y1), r7=109(x2), r8=41(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=436(x), r11=219(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 124
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 5
LDI r7, 109
LDI r8, 41
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 219
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
