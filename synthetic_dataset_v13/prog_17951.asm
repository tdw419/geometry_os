; DESCRIPTION: Composite: Draws a orange circle centered at (260, 55) with radius 21 then Places a red dot at position (128, 34).
; PLAN: r0=260(x), r1=55(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=128(x), r6=34(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 260
LDI r1, 55
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 128
LDI r6, 34
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
