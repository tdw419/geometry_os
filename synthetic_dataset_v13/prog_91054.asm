; DESCRIPTION: Composite: Places a magenta dot at position (449, 198) then Draws a blue circle centered at (337, 128) with radius 47.
; PLAN: r0=449(x), r1=198(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=337(x), r6=128(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 198
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 337
LDI r6, 128
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
