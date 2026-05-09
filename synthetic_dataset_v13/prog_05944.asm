; DESCRIPTION: Composite: Renders a yellow disk with center (187, 165) and radius 40 then Places a cyan dot at position (506, 204).
; PLAN: r0=187(x), r1=165(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=506(x), r6=204(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 165
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 506
LDI r6, 204
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
