; DESCRIPTION: Composite: Renders a red disk with center (126, 99) and radius 67 then Places a cyan dot at position (184, 247).
; PLAN: r0=126(x), r1=99(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=247(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 126
LDI r1, 99
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 247
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
