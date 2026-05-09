; DESCRIPTION: Composite: Renders a blue disk with center (247, 180) and radius 30 then Places a cyan dot at position (31, 38).
; PLAN: r0=247(x), r1=180(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=38(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 247
LDI r1, 180
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 38
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
