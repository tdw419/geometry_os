; DESCRIPTION: Composite: Places a red circle of radius 73 at center (339, 162) then Places a blue dot at position (431, 203).
; PLAN: r0=339(x), r1=162(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=203(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 339
LDI r1, 162
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 203
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
