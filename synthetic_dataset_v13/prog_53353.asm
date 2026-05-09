; DESCRIPTION: Composite: Places a yellow circle of radius 14 at center (320, 79) then Sets a single blue pixel at (287, 166).
; PLAN: r0=320(x), r1=79(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=166(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 79
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 166
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
