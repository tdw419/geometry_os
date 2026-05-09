; DESCRIPTION: Composite: Sets a single yellow pixel at (87, 255) then Creates a black rectangular region at (127, 12) spanning 17 by 39 pixels.
; PLAN: r0=87(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=12(y), r7=17(width), r8=39(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 127
LDI r6, 12
LDI r7, 17
LDI r8, 39
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
