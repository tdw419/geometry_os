; DESCRIPTION: Composite: Places a yellow circle of radius 13 at center (242, 19) then Places a purple dot at position (254, 40).
; PLAN: r0=242(x), r1=19(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=40(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 19
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 40
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
