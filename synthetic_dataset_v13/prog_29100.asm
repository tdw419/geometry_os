; DESCRIPTION: Composite: Places a black dot at position (329, 86) then Places a magenta circle of radius 64 at center (184, 123).
; PLAN: r0=329(x), r1=86(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=123(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 86
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 184
LDI r6, 123
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
