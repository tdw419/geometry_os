; DESCRIPTION: Composite: Sets a single purple pixel at (68, 109) then Creates a black rectangular region at (92, 92) spanning 55 by 47 pixels.
; PLAN: r0=68(x), r1=109(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=92(y), r7=55(width), r8=47(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 109
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 92
LDI r6, 92
LDI r7, 55
LDI r8, 47
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
