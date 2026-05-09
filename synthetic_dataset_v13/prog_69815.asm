; DESCRIPTION: Composite: Renders a black disk with center (46, 32) and radius 13 then Places a green dot at position (259, 1).
; PLAN: r0=46(x), r1=32(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=1(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 32
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 1
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
