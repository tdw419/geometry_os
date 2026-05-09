; DESCRIPTION: Composite: Draws a green circle centered at (241, 184) with radius 44 then Places a magenta dot at position (121, 151).
; PLAN: r0=241(x), r1=184(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=151(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 184
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 151
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
