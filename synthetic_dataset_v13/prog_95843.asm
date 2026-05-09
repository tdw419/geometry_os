; DESCRIPTION: Composite: Places a magenta dot at position (281, 151) then Places a yellow circle of radius 45 at center (442, 148).
; PLAN: r0=281(x), r1=151(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=148(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 151
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 442
LDI r6, 148
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
