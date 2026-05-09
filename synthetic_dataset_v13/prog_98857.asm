; DESCRIPTION: Composite: Draws a orange circle centered at (85, 136) with radius 78 then Places a purple dot at position (173, 120).
; PLAN: r0=85(x), r1=136(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=120(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 136
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 120
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
