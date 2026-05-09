; DESCRIPTION: Composite: Places a yellow dot at position (443, 180) then Places a blue circle of radius 53 at center (109, 179).
; PLAN: r0=443(x), r1=180(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=109(x), r6=179(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 443
LDI r1, 180
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 109
LDI r6, 179
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
