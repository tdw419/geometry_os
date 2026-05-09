; DESCRIPTION: Composite: Creates a cyan rectangular region at (318, 14) spanning 20 by 46 pixels then Draws a cyan circle centered at (111, 72) with radius 34 then Sets a single black pixel at (352, 154).
; PLAN: r0=318(x), r1=14(y), r2=20(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x), r6=72(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=352(x), r11=154(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 318
LDI r1, 14
LDI r2, 20
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 72
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 352
LDI r11, 154
LDI r12, 0x000000
PSET r10, r11, r12
HALT
