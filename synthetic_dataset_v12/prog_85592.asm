; DESCRIPTION: Composite: Places a white dot at position (98, 17) then Creates a black rectangular region at (122, 174) spanning 45 by 32 pixels.
; PLAN: r0=98(x), r1=17(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=174(y), r7=45(width), r8=32(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 17
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 174
LDI r7, 45
LDI r8, 32
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
