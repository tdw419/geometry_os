; DESCRIPTION: Composite: Sets a single magenta pixel at (57, 93) then Draws a green circle centered at (251, 166) with radius 10.
; PLAN: r0=57(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=166(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 57
LDI r1, 93
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 166
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
