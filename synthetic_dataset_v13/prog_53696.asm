; DESCRIPTION: Composite: Draws a magenta circle centered at (169, 29) with radius 19 then Places a cyan dot at position (9, 17).
; PLAN: r0=169(x), r1=29(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=17(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 29
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 17
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
