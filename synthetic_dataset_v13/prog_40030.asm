; DESCRIPTION: Composite: Places a orange dot at position (303, 3) then Draws a cyan circle centered at (95, 175) with radius 44.
; PLAN: r0=303(x), r1=3(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=175(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 3
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 95
LDI r6, 175
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
