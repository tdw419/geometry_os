; DESCRIPTION: Composite: Sets a single cyan pixel at (122, 13) then Renders a blue line between points (338, 238) and (167, 199) then Creates a cyan rectangular region at (85, 147) spanning 114 by 43 pixels.
; PLAN: r0=122(x), r1=13(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=338(x1), r6=238(y1), r7=167(x2), r8=199(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=85(x), r11=147(y), r12=114(width), r13=43(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 13
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 338
LDI r6, 238
LDI r7, 167
LDI r8, 199
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 147
LDI r12, 114
LDI r13, 43
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
