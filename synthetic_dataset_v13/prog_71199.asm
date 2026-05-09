; DESCRIPTION: Composite: Places a black dot at position (58, 23) then Creates a magenta circular shape at (346, 133) with radius 14.
; PLAN: r0=58(x), r1=23(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=133(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 23
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 346
LDI r6, 133
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
