; DESCRIPTION: Composite: Renders a cyan box of size 79x11 starting at (359, 238) then Places a white dot at position (494, 119).
; PLAN: r0=359(x), r1=238(y), r2=79(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x), r6=119(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 359
LDI r1, 238
LDI r2, 79
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 119
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
