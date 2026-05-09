; DESCRIPTION: Composite: Creates a green circular shape at (120, 46) with radius 44 then Places a cyan dot at position (481, 240).
; PLAN: r0=120(x), r1=46(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x), r6=240(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 46
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 240
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
