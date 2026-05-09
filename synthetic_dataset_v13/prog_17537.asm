; DESCRIPTION: Composite: Draws a white circle centered at (309, 109) with radius 80 then Places a red dot at position (16, 203).
; PLAN: r0=309(x), r1=109(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x), r6=203(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 109
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 203
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
