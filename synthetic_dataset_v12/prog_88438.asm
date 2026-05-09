; DESCRIPTION: Composite: Places a red dot at position (274, 113) then Creates a red rectangular region at (289, 87) spanning 81 by 25 pixels.
; PLAN: r0=274(x), r1=113(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=87(y), r7=81(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 113
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 289
LDI r6, 87
LDI r7, 81
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
