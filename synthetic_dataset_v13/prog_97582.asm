; DESCRIPTION: Composite: Places a red dot at position (42, 0) then Draws a cyan circle centered at (93, 157) with radius 29.
; PLAN: r0=42(x), r1=0(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=157(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 42
LDI r1, 0
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 93
LDI r6, 157
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
