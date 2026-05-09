; DESCRIPTION: Composite: Places a green dot at position (189, 166) then Places a black circle of radius 40 at center (395, 93).
; PLAN: r0=189(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=93(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 189
LDI r1, 166
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 395
LDI r6, 93
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
