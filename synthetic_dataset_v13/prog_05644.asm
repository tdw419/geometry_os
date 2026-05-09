; DESCRIPTION: Composite: Places a magenta dot at position (244, 133) then Creates a blue circular shape at (434, 165) with radius 59.
; PLAN: r0=244(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=165(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 244
LDI r1, 133
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 165
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
