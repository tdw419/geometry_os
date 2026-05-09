; DESCRIPTION: Composite: Sets a single orange pixel at (315, 45) then Creates a purple rectangular region at (302, 27) spanning 13 by 15 pixels then Renders a red disk with center (221, 78) and radius 44.
; PLAN: r0=315(x), r1=45(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=27(y), r7=13(width), r8=15(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x), r11=78(y), r12=44(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 45
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 302
LDI r6, 27
LDI r7, 13
LDI r8, 15
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 78
LDI r12, 44
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
