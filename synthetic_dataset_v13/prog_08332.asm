; DESCRIPTION: Composite: Places a orange dot at position (136, 137) then Creates a blue rectangular region at (436, 75) spanning 37 by 90 pixels.
; PLAN: r0=136(x), r1=137(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=436(x), r6=75(y), r7=37(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 137
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 436
LDI r6, 75
LDI r7, 37
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
