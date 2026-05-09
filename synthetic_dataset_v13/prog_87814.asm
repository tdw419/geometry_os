; DESCRIPTION: Composite: Sets a single blue pixel at (67, 113) then Creates a black rectangular region at (27, 115) spanning 105 by 44 pixels.
; PLAN: r0=67(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=27(x), r6=115(y), r7=105(width), r8=44(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 27
LDI r6, 115
LDI r7, 105
LDI r8, 44
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
