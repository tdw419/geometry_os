; DESCRIPTION: Composite: Sets a single black pixel at (287, 160) then Creates a red rectangular region at (118, 64) spanning 14 by 15 pixels.
; PLAN: r0=287(x), r1=160(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=64(y), r7=14(width), r8=15(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 160
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 118
LDI r6, 64
LDI r7, 14
LDI r8, 15
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
