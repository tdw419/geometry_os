; DESCRIPTION: Composite: Draws a blue circle centered at (402, 48) with radius 38 then Sets a single orange pixel at (434, 119).
; PLAN: r0=402(x), r1=48(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x), r6=119(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 48
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 119
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
