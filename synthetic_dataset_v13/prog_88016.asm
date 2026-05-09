; DESCRIPTION: Composite: Places a orange dot at position (188, 43) then Places a green circle of radius 35 at center (107, 173).
; PLAN: r0=188(x), r1=43(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=173(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 188
LDI r1, 43
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 107
LDI r6, 173
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
