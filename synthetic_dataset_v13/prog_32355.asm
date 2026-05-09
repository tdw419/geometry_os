; DESCRIPTION: Composite: Renders a orange disk with center (303, 160) and radius 31 then Creates a yellow rectangular region at (142, 72) spanning 78 by 90 pixels then Places a cyan dot at position (349, 105).
; PLAN: r0=303(x), r1=160(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x), r6=72(y), r7=78(width), r8=90(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=349(x), r11=105(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 160
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 72
LDI r7, 78
LDI r8, 90
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 105
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
