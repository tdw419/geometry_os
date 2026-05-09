; DESCRIPTION: Composite: Sets a single purple pixel at (279, 234) then Draws a magenta circle centered at (284, 151) with radius 68.
; PLAN: r0=279(x), r1=234(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=151(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 234
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 284
LDI r6, 151
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
