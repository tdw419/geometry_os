; DESCRIPTION: Composite: Sets a single black pixel at (116, 254) then Creates a black rectangular region at (220, 164) spanning 69 by 78 pixels.
; PLAN: r0=116(x), r1=254(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=220(x), r6=164(y), r7=69(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 254
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 220
LDI r6, 164
LDI r7, 69
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
