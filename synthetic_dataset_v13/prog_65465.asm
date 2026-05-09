; DESCRIPTION: Composite: Sets a single red pixel at (329, 4) then Draws a red circle centered at (239, 102) with radius 67.
; PLAN: r0=329(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=102(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 4
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 239
LDI r6, 102
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
