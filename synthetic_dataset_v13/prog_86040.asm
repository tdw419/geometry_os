; DESCRIPTION: Composite: Places a blue circle of radius 59 at center (413, 141) then Places a magenta dot at position (490, 156).
; PLAN: r0=413(x), r1=141(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x), r6=156(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 413
LDI r1, 141
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 156
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
