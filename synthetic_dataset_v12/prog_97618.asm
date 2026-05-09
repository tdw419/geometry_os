; DESCRIPTION: Composite: Places a red dot at position (30, 235) then Renders a orange line between points (399, 208) and (320, 111) then Draws a black circle centered at (376, 189) with radius 48.
; PLAN: r0=30(x), r1=235(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=399(x1), r6=208(y1), r7=320(x2), r8=111(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=376(x), r11=189(y), r12=48(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 30
LDI r1, 235
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 399
LDI r6, 208
LDI r7, 320
LDI r8, 111
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 189
LDI r12, 48
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
