; DESCRIPTION: Composite: Places a green dot at position (145, 195) then Places a magenta circle of radius 64 at center (137, 141).
; PLAN: r0=145(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=141(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 195
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 137
LDI r6, 141
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
