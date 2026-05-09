; DESCRIPTION: Composite: Draws a blue circle centered at (294, 87) with radius 60 then Places a magenta dot at position (107, 206).
; PLAN: r0=294(x), r1=87(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=206(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 294
LDI r1, 87
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 206
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
