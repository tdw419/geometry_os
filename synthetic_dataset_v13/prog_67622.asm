; DESCRIPTION: Composite: Places a magenta dot at position (279, 71) then Creates a green circular shape at (127, 134) with radius 48.
; PLAN: r0=279(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=134(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 71
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 134
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
