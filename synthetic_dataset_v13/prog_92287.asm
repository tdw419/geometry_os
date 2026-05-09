; DESCRIPTION: Composite: Renders a green line between points (174, 254) and (480, 235) then Creates a yellow rectangular region at (405, 0) spanning 64 by 112 pixels then Sets a single black pixel at (266, 19).
; PLAN: r0=174(x1), r1=254(y1), r2=480(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=0(y), r7=64(width), r8=112(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=266(x), r11=19(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 254
LDI r2, 480
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 0
LDI r7, 64
LDI r8, 112
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 19
LDI r12, 0x000000
PSET r10, r11, r12
HALT
