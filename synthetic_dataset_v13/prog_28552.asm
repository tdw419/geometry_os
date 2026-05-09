; DESCRIPTION: Composite: Renders a red disk with center (370, 100) and radius 56 then Places a blue dot at position (473, 102).
; PLAN: r0=370(x), r1=100(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x), r6=102(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 100
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 102
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
