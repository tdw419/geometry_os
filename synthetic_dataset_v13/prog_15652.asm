; DESCRIPTION: Composite: Places a blue dot at position (48, 195) then Places a yellow circle of radius 28 at center (170, 193).
; PLAN: r0=48(x), r1=195(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=193(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 48
LDI r1, 195
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 170
LDI r6, 193
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
