; DESCRIPTION: Composite: Places a orange dot at position (185, 236) then Renders a magenta disk with center (45, 101) and radius 15.
; PLAN: r0=185(x), r1=236(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=101(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 236
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 45
LDI r6, 101
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
