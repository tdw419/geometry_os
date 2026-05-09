; DESCRIPTION: Composite: Draws a magenta circle centered at (421, 136) with radius 52 then Places a cyan dot at position (68, 65).
; PLAN: r0=421(x), r1=136(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=65(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 136
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 65
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
