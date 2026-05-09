; DESCRIPTION: Composite: Places a cyan circle of radius 79 at center (206, 101) then Places a white dot at position (311, 95).
; PLAN: r0=206(x), r1=101(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=95(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 206
LDI r1, 101
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 95
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
