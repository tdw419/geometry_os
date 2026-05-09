; DESCRIPTION: Composite: Creates a green circular shape at (304, 200) with radius 18 then Places a green dot at position (92, 19).
; PLAN: r0=304(x), r1=200(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=19(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 200
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 19
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
