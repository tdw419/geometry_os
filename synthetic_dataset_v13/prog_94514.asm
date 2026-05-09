; DESCRIPTION: Composite: Creates a green circular shape at (92, 114) with radius 71 then Places a blue dot at position (113, 190).
; PLAN: r0=92(x), r1=114(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=190(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 114
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 190
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
