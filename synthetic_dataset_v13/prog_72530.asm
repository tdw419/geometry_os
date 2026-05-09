; DESCRIPTION: Composite: Places a red dot at position (83, 134) then Renders a magenta disk with center (150, 138) and radius 27.
; PLAN: r0=83(x), r1=134(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=138(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 83
LDI r1, 134
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 150
LDI r6, 138
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
