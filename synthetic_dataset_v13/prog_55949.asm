; DESCRIPTION: Composite: Sets a single black pixel at (400, 127) then Creates a white rectangular region at (318, 4) spanning 82 by 106 pixels.
; PLAN: r0=400(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=4(y), r7=82(width), r8=106(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 318
LDI r6, 4
LDI r7, 82
LDI r8, 106
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
