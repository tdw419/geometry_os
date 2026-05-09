; DESCRIPTION: Composite: Places a magenta circle of radius 13 at center (106, 230) then Places a magenta dot at position (108, 139).
; PLAN: r0=106(x), r1=230(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=139(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 230
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 139
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
