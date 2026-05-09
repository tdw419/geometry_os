; DESCRIPTION: Composite: Sets a single black pixel at (21, 0) then Places a green circle of radius 30 at center (101, 112).
; PLAN: r0=21(x), r1=0(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=101(x), r6=112(y), r7=30(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 0
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 101
LDI r6, 112
LDI r7, 30
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
