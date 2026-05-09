; DESCRIPTION: Composite: Draws a orange circle centered at (146, 142) with radius 44 then Sets a single red pixel at (31, 135).
; PLAN: r0=146(x), r1=142(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=135(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 142
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 135
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
