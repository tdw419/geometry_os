; DESCRIPTION: Composite: Places a blue dot at position (52, 151) then Draws a black circle centered at (455, 97) with radius 42.
; PLAN: r0=52(x), r1=151(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=455(x), r6=97(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 151
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 455
LDI r6, 97
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
