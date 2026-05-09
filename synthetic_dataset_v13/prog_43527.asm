; DESCRIPTION: Composite: Creates a magenta circular shape at (424, 80) with radius 63 then Places a magenta dot at position (385, 244).
; PLAN: r0=424(x), r1=80(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=244(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 424
LDI r1, 80
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 244
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
