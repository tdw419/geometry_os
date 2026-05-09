; DESCRIPTION: Composite: Draws a white circle centered at (443, 144) with radius 55 then Places a orange dot at position (252, 209).
; PLAN: r0=443(x), r1=144(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=209(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 443
LDI r1, 144
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 209
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
