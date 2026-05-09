; DESCRIPTION: Composite: Places a orange dot at position (94, 214) then Places a magenta circle of radius 15 at center (122, 209).
; PLAN: r0=94(x), r1=214(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=209(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 214
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 122
LDI r6, 209
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
