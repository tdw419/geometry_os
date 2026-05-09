; DESCRIPTION: Composite: Creates a green circular shape at (59, 50) with radius 45 then Places a yellow dot at position (28, 88).
; PLAN: r0=59(x), r1=50(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x), r6=88(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 59
LDI r1, 50
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 88
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
