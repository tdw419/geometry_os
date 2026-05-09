; DESCRIPTION: Composite: Places a magenta dot at position (484, 5) then Renders a black disk with center (380, 183) and radius 56 then Places a white line segment connecting (26, 251) to (69, 73).
; PLAN: r0=484(x), r1=5(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=183(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x1), r11=251(y1), r12=69(x2), r13=73(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 5
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 380
LDI r6, 183
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 251
LDI r12, 69
LDI r13, 73
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
