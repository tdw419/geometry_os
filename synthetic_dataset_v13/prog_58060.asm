; DESCRIPTION: Composite: Places a orange dot at position (463, 161) then Renders a black disk with center (255, 112) and radius 38.
; PLAN: r0=463(x), r1=161(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=112(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 463
LDI r1, 161
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 255
LDI r6, 112
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
