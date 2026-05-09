; DESCRIPTION: Composite: Sets a single red pixel at (349, 139) then Draws a blue circle centered at (228, 205) with radius 50.
; PLAN: r0=349(x), r1=139(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=205(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 349
LDI r1, 139
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 228
LDI r6, 205
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
