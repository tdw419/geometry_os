; DESCRIPTION: Composite: Places a cyan 93x43 rectangle at position (238, 7) then Sets a single red pixel at (479, 238).
; PLAN: r0=238(x), r1=7(y), r2=93(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x), r6=238(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 7
LDI r2, 93
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 238
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
