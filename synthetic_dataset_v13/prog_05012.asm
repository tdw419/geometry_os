; DESCRIPTION: Composite: Places a green dot at position (82, 82) then Places a magenta circle of radius 46 at center (434, 105).
; PLAN: r0=82(x), r1=82(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=105(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 82
LDI r1, 82
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 434
LDI r6, 105
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
