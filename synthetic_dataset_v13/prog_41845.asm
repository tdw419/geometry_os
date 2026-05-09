; DESCRIPTION: Composite: Draws a red circle centered at (312, 208) with radius 36 then Places a black dot at position (234, 141).
; PLAN: r0=312(x), r1=208(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=141(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 208
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 141
LDI r7, 0x000000
PSET r5, r6, r7
HALT
