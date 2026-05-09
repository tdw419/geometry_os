; DESCRIPTION: Composite: Places a yellow dot at position (284, 69) then Creates a red circular shape at (81, 102) with radius 74.
; PLAN: r0=284(x), r1=69(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=102(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 69
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 81
LDI r6, 102
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
