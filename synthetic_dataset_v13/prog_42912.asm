; DESCRIPTION: Composite: Places a red circle of radius 79 at center (366, 103) then Places a blue dot at position (26, 19).
; PLAN: r0=366(x), r1=103(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=19(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 366
LDI r1, 103
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 19
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
