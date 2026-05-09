; DESCRIPTION: Composite: Draws a black circle centered at (242, 188) with radius 59 then Places a red dot at position (499, 199).
; PLAN: r0=242(x), r1=188(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x), r6=199(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 188
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 199
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
