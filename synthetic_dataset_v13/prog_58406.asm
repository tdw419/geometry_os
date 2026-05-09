; DESCRIPTION: Composite: Sets a single green pixel at (445, 206) then Draws a orange circle centered at (426, 80) with radius 78.
; PLAN: r0=445(x), r1=206(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=80(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 206
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 426
LDI r6, 80
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
