; DESCRIPTION: Composite: Sets a single cyan pixel at (138, 133) then Renders a white disk with center (100, 184) and radius 30.
; PLAN: r0=138(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=184(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 184
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
