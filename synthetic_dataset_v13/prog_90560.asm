; DESCRIPTION: Composite: Sets a single white pixel at (415, 188) then Places a orange circle of radius 11 at center (252, 63).
; PLAN: r0=415(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=63(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 415
LDI r1, 188
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 63
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
