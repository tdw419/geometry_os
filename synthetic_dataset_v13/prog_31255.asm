; DESCRIPTION: Composite: Places a red dot at position (165, 235) then Places a magenta line segment connecting (42, 147) to (510, 17) then Creates a blue circular shape at (130, 151) with radius 44.
; PLAN: r0=165(x), r1=235(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=147(y1), r7=510(x2), r8=17(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=130(x), r11=151(y), r12=44(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 235
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 42
LDI r6, 147
LDI r7, 510
LDI r8, 17
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 151
LDI r12, 44
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
