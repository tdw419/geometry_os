; DESCRIPTION: Composite: Places a yellow dot at position (113, 151) then Draws a magenta circle centered at (283, 51) with radius 17.
; PLAN: r0=113(x), r1=151(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=51(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 113
LDI r1, 151
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 283
LDI r6, 51
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
