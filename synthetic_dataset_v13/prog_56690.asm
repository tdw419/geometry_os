; DESCRIPTION: Composite: Places a orange dot at position (233, 173) then Draws a yellow circle centered at (205, 47) with radius 11.
; PLAN: r0=233(x), r1=173(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=47(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 233
LDI r1, 173
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 205
LDI r6, 47
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
