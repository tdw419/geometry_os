; DESCRIPTION: Composite: Places a red dot at position (191, 117) then Places a magenta circle of radius 46 at center (324, 195).
; PLAN: r0=191(x), r1=117(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=195(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 191
LDI r1, 117
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 324
LDI r6, 195
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
