; DESCRIPTION: Composite: Sets a single black pixel at (418, 116) then Creates a green rectangular region at (371, 230) spanning 49 by 23 pixels.
; PLAN: r0=418(x), r1=116(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=230(y), r7=49(width), r8=23(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 116
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 371
LDI r6, 230
LDI r7, 49
LDI r8, 23
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
