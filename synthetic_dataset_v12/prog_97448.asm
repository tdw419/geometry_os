; DESCRIPTION: Composite: Places a blue dot at position (262, 188) then Draws a purple circle centered at (98, 152) with radius 48.
; PLAN: r0=262(x), r1=188(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=152(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 188
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 98
LDI r6, 152
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
