; DESCRIPTION: Composite: Draws a yellow circle centered at (269, 90) with radius 30 then Places a blue dot at position (127, 202).
; PLAN: r0=269(x), r1=90(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=202(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 269
LDI r1, 90
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 202
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
