; DESCRIPTION: Composite: Sets a single purple pixel at (476, 214) then Draws a orange circle centered at (405, 164) with radius 71.
; PLAN: r0=476(x), r1=214(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=164(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 476
LDI r1, 214
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 164
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
