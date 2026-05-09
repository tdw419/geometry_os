; DESCRIPTION: Composite: Draws a red circle centered at (360, 150) with radius 65 then Sets a single red pixel at (132, 241).
; PLAN: r0=360(x), r1=150(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=241(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 150
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 241
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
