; DESCRIPTION: Composite: Places a green circle of radius 74 at center (101, 118) then Places a yellow dot at position (279, 238).
; PLAN: r0=101(x), r1=118(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=238(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 101
LDI r1, 118
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 238
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
