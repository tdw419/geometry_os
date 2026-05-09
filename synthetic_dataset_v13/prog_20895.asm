; DESCRIPTION: Composite: Draws a green circle centered at (101, 190) with radius 25 then Places a green dot at position (291, 222).
; PLAN: r0=101(x), r1=190(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=222(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 101
LDI r1, 190
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 222
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
