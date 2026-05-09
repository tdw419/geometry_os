; DESCRIPTION: Composite: Sets a single magenta pixel at (476, 113) then Creates a red rectangular region at (274, 84) spanning 78 by 35 pixels.
; PLAN: r0=476(x), r1=113(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=84(y), r7=78(width), r8=35(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 113
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 274
LDI r6, 84
LDI r7, 78
LDI r8, 35
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
