; DESCRIPTION: Composite: Draws a orange circle centered at (397, 114) with radius 80 then Places a blue dot at position (174, 86).
; PLAN: r0=397(x), r1=114(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=86(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 397
LDI r1, 114
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 86
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
