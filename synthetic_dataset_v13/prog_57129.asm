; DESCRIPTION: Composite: Draws a purple circle centered at (212, 130) with radius 79 then Places a green dot at position (156, 103).
; PLAN: r0=212(x), r1=130(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=103(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 130
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 103
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
