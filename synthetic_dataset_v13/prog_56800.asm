; DESCRIPTION: Composite: Sets a single black pixel at (420, 148) then Creates a purple rectangular region at (468, 214) spanning 15 by 39 pixels.
; PLAN: r0=420(x), r1=148(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=468(x), r6=214(y), r7=15(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 148
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 468
LDI r6, 214
LDI r7, 15
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
