; DESCRIPTION: Composite: Creates a yellow circular shape at (266, 70) with radius 69 then Places a blue dot at position (5, 16).
; PLAN: r0=266(x), r1=70(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=16(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 70
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 16
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
