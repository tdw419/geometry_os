; DESCRIPTION: Composite: Draws a orange circle centered at (416, 96) with radius 77 then Sets a single black pixel at (29, 25).
; PLAN: r0=416(x), r1=96(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=25(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 96
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 25
LDI r7, 0x000000
PSET r5, r6, r7
HALT
