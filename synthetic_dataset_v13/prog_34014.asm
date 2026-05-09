; DESCRIPTION: Composite: Places a yellow dot at position (30, 239) then Creates a purple circular shape at (112, 109) with radius 39.
; PLAN: r0=30(x), r1=239(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=109(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 239
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 112
LDI r6, 109
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
