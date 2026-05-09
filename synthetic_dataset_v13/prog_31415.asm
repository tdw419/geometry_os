; DESCRIPTION: Composite: Creates a magenta circular shape at (106, 59) with radius 51 then Places a blue dot at position (269, 5).
; PLAN: r0=106(x), r1=59(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=5(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 59
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 5
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
