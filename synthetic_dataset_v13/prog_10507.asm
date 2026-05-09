; DESCRIPTION: Composite: Draws a cyan circle centered at (295, 138) with radius 24 then Places a white dot at position (437, 219).
; PLAN: r0=295(x), r1=138(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=219(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 295
LDI r1, 138
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 219
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
