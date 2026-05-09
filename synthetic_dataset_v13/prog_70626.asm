; DESCRIPTION: Composite: Draws a cyan circle centered at (368, 61) with radius 61 then Places a magenta dot at position (111, 22).
; PLAN: r0=368(x), r1=61(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=22(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 368
LDI r1, 61
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 22
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
