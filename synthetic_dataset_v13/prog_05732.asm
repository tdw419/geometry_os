; DESCRIPTION: Composite: Renders a orange disk with center (394, 172) and radius 33 then Places a green dot at position (454, 215).
; PLAN: r0=394(x), r1=172(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x), r6=215(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 394
LDI r1, 172
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 215
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
