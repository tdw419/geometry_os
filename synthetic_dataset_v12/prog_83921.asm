; DESCRIPTION: Composite: Sets a single red pixel at (391, 2) then Draws a yellow rectangle at (81, 199) with width 119 and height 21 then Creates a white circular shape at (148, 112) with radius 57.
; PLAN: r0=391(x), r1=2(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=199(y), r7=119(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=148(x), r11=112(y), r12=57(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 2
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 81
LDI r6, 199
LDI r7, 119
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 112
LDI r12, 57
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
