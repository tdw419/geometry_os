; DESCRIPTION: Composite: Sets a single magenta pixel at (79, 39) then Creates a cyan circular shape at (327, 63) with radius 47.
; PLAN: r0=79(x), r1=39(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=63(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 79
LDI r1, 39
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 63
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
