; DESCRIPTION: Composite: Sets a single red pixel at (103, 33) then Places a black circle of radius 15 at center (455, 90) then Places a red line segment connecting (399, 44) to (156, 174).
; PLAN: r0=103(x), r1=33(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=455(x), r6=90(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=399(x1), r11=44(y1), r12=156(x2), r13=174(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 33
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 455
LDI r6, 90
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 399
LDI r11, 44
LDI r12, 156
LDI r13, 174
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
