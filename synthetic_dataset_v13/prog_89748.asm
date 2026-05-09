; DESCRIPTION: Composite: Places a white dot at position (169, 126) then Draws a orange circle centered at (95, 91) with radius 49.
; PLAN: r0=169(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=91(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 169
LDI r1, 126
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 95
LDI r6, 91
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
