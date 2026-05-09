; DESCRIPTION: Composite: Places a red dot at position (268, 184) then Draws a black circle centered at (214, 96) with radius 50.
; PLAN: r0=268(x), r1=184(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=96(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 268
LDI r1, 184
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 214
LDI r6, 96
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
