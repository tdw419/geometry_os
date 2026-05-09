; DESCRIPTION: Composite: Renders a cyan box of size 73x94 starting at (33, 71) then Places a white dot at position (478, 176).
; PLAN: r0=33(x), r1=71(y), r2=73(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=176(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 71
LDI r2, 73
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 176
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
