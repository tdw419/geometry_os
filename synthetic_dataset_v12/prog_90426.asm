; DESCRIPTION: Composite: Creates a white circular shape at (421, 127) with radius 11 then Places a magenta dot at position (431, 168).
; PLAN: r0=421(x), r1=127(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=168(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 127
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 168
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
