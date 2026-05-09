; DESCRIPTION: Composite: Sets a single red pixel at (345, 236) then Draws a magenta circle centered at (392, 163) with radius 33.
; PLAN: r0=345(x), r1=236(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=163(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 236
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 392
LDI r6, 163
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
