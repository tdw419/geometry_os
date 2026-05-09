; DESCRIPTION: Composite: Places a magenta circle of radius 46 at center (250, 184) then Places a cyan dot at position (466, 103).
; PLAN: r0=250(x), r1=184(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=103(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 184
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 103
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
