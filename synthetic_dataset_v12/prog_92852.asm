; DESCRIPTION: Composite: Places a black dot at position (264, 88) then Places a magenta circle of radius 32 at center (149, 100).
; PLAN: r0=264(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=100(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 264
LDI r1, 88
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 149
LDI r6, 100
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
