; DESCRIPTION: Composite: Places a blue dot at position (91, 4) then Creates a white rectangular region at (447, 35) spanning 12 by 36 pixels.
; PLAN: r0=91(x), r1=4(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=35(y), r7=12(width), r8=36(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 4
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 447
LDI r6, 35
LDI r7, 12
LDI r8, 36
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
