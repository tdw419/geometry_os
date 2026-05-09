; DESCRIPTION: Composite: Places a cyan dot at position (285, 149) then Places a magenta circle of radius 73 at center (320, 140).
; PLAN: r0=285(x), r1=149(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=140(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 149
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 140
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
