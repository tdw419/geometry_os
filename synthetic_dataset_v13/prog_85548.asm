; DESCRIPTION: Composite: Places a purple dot at position (114, 166) then Creates a yellow circular shape at (331, 116) with radius 48.
; PLAN: r0=114(x), r1=166(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=331(x), r6=116(y), r7=48(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 166
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 331
LDI r6, 116
LDI r7, 48
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
