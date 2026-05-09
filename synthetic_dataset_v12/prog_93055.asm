; DESCRIPTION: Composite: Draws a cyan circle centered at (180, 52) with radius 52 then Places a black dot at position (154, 189).
; PLAN: r0=180(x), r1=52(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=189(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 52
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 189
LDI r7, 0x000000
PSET r5, r6, r7
HALT
