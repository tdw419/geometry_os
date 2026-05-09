; DESCRIPTION: Composite: Places a blue dot at position (185, 25) then Draws a yellow circle centered at (229, 56) with radius 52.
; PLAN: r0=185(x), r1=25(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=56(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 25
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 229
LDI r6, 56
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
