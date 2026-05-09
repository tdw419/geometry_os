; DESCRIPTION: Composite: Places a orange circle of radius 15 at center (150, 78) then Creates a green rectangular region at (11, 194) spanning 110 by 51 pixels then Places a black dot at position (272, 111).
; PLAN: r0=150(x), r1=78(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=194(y), r7=110(width), r8=51(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=111(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 150
LDI r1, 78
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 194
LDI r7, 110
LDI r8, 51
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 111
LDI r12, 0x000000
PSET r10, r11, r12
HALT
