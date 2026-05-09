; DESCRIPTION: Composite: Renders a cyan box of size 90x107 starting at (47, 62) then Places a blue dot at position (93, 45).
; PLAN: r0=47(x), r1=62(y), r2=90(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=45(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 47
LDI r1, 62
LDI r2, 90
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 45
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
