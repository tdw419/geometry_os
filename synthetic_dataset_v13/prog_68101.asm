; DESCRIPTION: Composite: Places a red circle of radius 18 at center (60, 80) then Places a blue dot at position (337, 32).
; PLAN: r0=60(x), r1=80(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x), r6=32(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 60
LDI r1, 80
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 32
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
