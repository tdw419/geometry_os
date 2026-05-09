; DESCRIPTION: Composite: Places a yellow dot at position (170, 90) then Draws a white circle centered at (283, 68) with radius 34.
; PLAN: r0=170(x), r1=90(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=68(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 170
LDI r1, 90
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 283
LDI r6, 68
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
