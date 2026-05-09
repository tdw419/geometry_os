; DESCRIPTION: Composite: Places a cyan dot at position (400, 27) then Draws a blue circle centered at (199, 160) with radius 31.
; PLAN: r0=400(x), r1=27(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=199(x), r6=160(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 27
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 199
LDI r6, 160
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
