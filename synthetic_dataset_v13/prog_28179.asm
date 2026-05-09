; DESCRIPTION: Composite: Sets a single black pixel at (27, 105) then Creates a purple rectangular region at (226, 116) spanning 108 by 20 pixels.
; PLAN: r0=27(x), r1=105(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=116(y), r7=108(width), r8=20(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 27
LDI r1, 105
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 226
LDI r6, 116
LDI r7, 108
LDI r8, 20
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
