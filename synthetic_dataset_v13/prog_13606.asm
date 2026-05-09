; DESCRIPTION: Composite: Places a orange dot at position (120, 173) then Draws a red circle centered at (415, 45) with radius 12.
; PLAN: r0=120(x), r1=173(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=45(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 120
LDI r1, 173
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 415
LDI r6, 45
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
