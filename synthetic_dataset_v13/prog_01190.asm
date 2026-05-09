; DESCRIPTION: Composite: Sets a single orange pixel at (21, 26) then Creates a cyan rectangular region at (315, 77) spanning 116 by 108 pixels then Renders a cyan disk with center (475, 236) and radius 11.
; PLAN: r0=21(x), r1=26(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=77(y), r7=116(width), r8=108(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=475(x), r11=236(y), r12=11(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 26
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 315
LDI r6, 77
LDI r7, 116
LDI r8, 108
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 236
LDI r12, 11
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
