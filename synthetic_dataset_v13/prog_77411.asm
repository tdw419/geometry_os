; DESCRIPTION: Composite: Sets a single cyan pixel at (429, 140) then Renders a orange disk with center (333, 89) and radius 76.
; PLAN: r0=429(x), r1=140(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=333(x), r6=89(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 429
LDI r1, 140
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 333
LDI r6, 89
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
