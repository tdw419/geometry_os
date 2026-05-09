; DESCRIPTION: Composite: Places a black dot at position (361, 96) then Renders a yellow disk with center (406, 139) and radius 69.
; PLAN: r0=361(x), r1=96(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=139(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 361
LDI r1, 96
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 406
LDI r6, 139
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
