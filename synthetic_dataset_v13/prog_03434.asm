; DESCRIPTION: Composite: Draws a purple circle centered at (320, 99) with radius 80 then Sets a single orange pixel at (144, 231).
; PLAN: r0=320(x), r1=99(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=231(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 99
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 231
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
