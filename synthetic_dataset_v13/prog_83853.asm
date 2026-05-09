; DESCRIPTION: Composite: Sets a single black pixel at (318, 81) then Draws a red circle centered at (235, 84) with radius 44 then Creates a magenta rectangular region at (27, 98) spanning 72 by 79 pixels.
; PLAN: r0=318(x), r1=81(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=84(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=98(y), r12=72(width), r13=79(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 81
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 235
LDI r6, 84
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 98
LDI r12, 72
LDI r13, 79
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
