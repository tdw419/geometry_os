; DESCRIPTION: Composite: Places a black circle of radius 16 at center (88, 226) then Places a blue dot at position (481, 157).
; PLAN: r0=88(x), r1=226(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x), r6=157(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 88
LDI r1, 226
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 157
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
