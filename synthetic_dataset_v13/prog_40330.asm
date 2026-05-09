; DESCRIPTION: Composite: Places a magenta dot at position (341, 237) then Draws a cyan circle centered at (127, 185) with radius 46.
; PLAN: r0=341(x), r1=237(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=185(y), r7=46(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 237
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 185
LDI r7, 46
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
