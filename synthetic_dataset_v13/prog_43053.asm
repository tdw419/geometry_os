; DESCRIPTION: Composite: Places a yellow dot at position (501, 117) then Renders a black disk with center (115, 82) and radius 40.
; PLAN: r0=501(x), r1=117(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=115(x), r6=82(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 501
LDI r1, 117
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 115
LDI r6, 82
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
