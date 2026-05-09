; DESCRIPTION: Composite: Draws a purple circle centered at (148, 111) with radius 43 then Places a green dot at position (313, 188).
; PLAN: r0=148(x), r1=111(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x), r6=188(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 148
LDI r1, 111
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 188
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
