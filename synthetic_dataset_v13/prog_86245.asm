; DESCRIPTION: Composite: Renders a red disk with center (251, 186) and radius 39 then Places a white dot at position (492, 189).
; PLAN: r0=251(x), r1=186(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x), r6=189(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 186
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 189
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
