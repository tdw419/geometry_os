; DESCRIPTION: Composite: Places a black dot at position (56, 116) then Renders a red disk with center (261, 24) and radius 13.
; PLAN: r0=56(x), r1=116(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=24(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 56
LDI r1, 116
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 261
LDI r6, 24
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
