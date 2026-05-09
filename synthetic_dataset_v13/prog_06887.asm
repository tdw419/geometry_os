; DESCRIPTION: Composite: Places a red dot at position (82, 170) then Places a magenta circle of radius 14 at center (148, 29).
; PLAN: r0=82(x), r1=170(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=29(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 82
LDI r1, 170
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 148
LDI r6, 29
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
