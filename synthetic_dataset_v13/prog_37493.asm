; DESCRIPTION: Composite: Draws a black circle centered at (283, 210) with radius 40 then Places a magenta dot at position (411, 97).
; PLAN: r0=283(x), r1=210(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=97(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 283
LDI r1, 210
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 97
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
