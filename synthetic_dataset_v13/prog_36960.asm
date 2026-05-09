; DESCRIPTION: Composite: Renders a orange disk with center (253, 119) and radius 47 then Places a white dot at position (305, 243).
; PLAN: r0=253(x), r1=119(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=243(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 119
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 243
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
