; DESCRIPTION: Composite: Places a blue circle of radius 46 at center (370, 100) then Places a yellow dot at position (402, 49).
; PLAN: r0=370(x), r1=100(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=49(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 100
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 49
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
