; DESCRIPTION: Composite: Places a yellow circle of radius 43 at center (95, 128) then Renders a black line between points (105, 235) and (111, 0) then Places a black dot at position (495, 143).
; PLAN: r0=95(x), r1=128(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x1), r6=235(y1), r7=111(x2), r8=0(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=495(x), r11=143(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 128
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 235
LDI r7, 111
LDI r8, 0
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 495
LDI r11, 143
LDI r12, 0x000000
PSET r10, r11, r12
HALT
