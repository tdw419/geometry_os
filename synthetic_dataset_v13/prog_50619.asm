; DESCRIPTION: Composite: Creates a orange circular shape at (71, 113) with radius 56 then Places a green dot at position (45, 92).
; PLAN: r0=71(x), r1=113(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=92(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 113
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 92
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
