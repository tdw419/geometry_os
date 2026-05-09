; DESCRIPTION: Composite: Places a green dot at position (303, 95) then Draws a white circle centered at (172, 43) with radius 41.
; PLAN: r0=303(x), r1=95(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=172(x), r6=43(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 95
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 172
LDI r6, 43
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
