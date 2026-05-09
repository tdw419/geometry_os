; DESCRIPTION: Composite: Places a white circle of radius 30 at center (322, 134) then Places a magenta dot at position (166, 157).
; PLAN: r0=322(x), r1=134(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=157(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 134
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 157
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
