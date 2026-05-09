; DESCRIPTION: Composite: Renders a blue disk with center (233, 35) and radius 11 then Places a yellow dot at position (455, 131).
; PLAN: r0=233(x), r1=35(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=131(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 233
LDI r1, 35
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 131
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
