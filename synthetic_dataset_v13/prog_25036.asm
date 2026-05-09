; DESCRIPTION: Composite: Places a green dot at position (222, 191) then Places a magenta circle of radius 36 at center (46, 199).
; PLAN: r0=222(x), r1=191(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=199(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 191
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 46
LDI r6, 199
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
