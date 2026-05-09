; DESCRIPTION: Composite: Sets a single blue pixel at (178, 92) then Renders a cyan line between points (496, 29) and (178, 73) then Creates a black rectangular region at (351, 77) spanning 70 by 39 pixels.
; PLAN: r0=178(x), r1=92(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=496(x1), r6=29(y1), r7=178(x2), r8=73(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=351(x), r11=77(y), r12=70(width), r13=39(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 92
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 496
LDI r6, 29
LDI r7, 178
LDI r8, 73
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 77
LDI r12, 70
LDI r13, 39
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
