; DESCRIPTION: Composite: Places a yellow dot at position (13, 97) then Renders a cyan disk with center (194, 165) and radius 43.
; PLAN: r0=13(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=165(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 194
LDI r6, 165
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
