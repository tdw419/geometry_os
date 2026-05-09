; DESCRIPTION: Composite: Places a purple dot at position (509, 169) then Creates a yellow circular shape at (221, 67) with radius 28.
; PLAN: r0=509(x), r1=169(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=67(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 509
LDI r1, 169
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 221
LDI r6, 67
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
