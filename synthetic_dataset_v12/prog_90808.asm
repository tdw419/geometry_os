; DESCRIPTION: Composite: Places a magenta dot at position (175, 226) then Places a black circle of radius 14 at center (153, 136).
; PLAN: r0=175(x), r1=226(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=136(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 175
LDI r1, 226
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 153
LDI r6, 136
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
