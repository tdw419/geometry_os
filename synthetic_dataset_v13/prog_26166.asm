; DESCRIPTION: Composite: Places a purple dot at position (24, 32) then Creates a yellow circular shape at (133, 171) with radius 59.
; PLAN: r0=24(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=171(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 32
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 171
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
