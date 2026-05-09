; DESCRIPTION: Composite: Places a yellow circle of radius 27 at center (154, 183) then Places a blue dot at position (259, 237).
; PLAN: r0=154(x), r1=183(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=237(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 154
LDI r1, 183
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 237
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
