; DESCRIPTION: Composite: Sets a single red pixel at (499, 108) then Places a orange circle of radius 51 at center (97, 121).
; PLAN: r0=499(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=97(x), r6=121(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 499
LDI r1, 108
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 97
LDI r6, 121
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
