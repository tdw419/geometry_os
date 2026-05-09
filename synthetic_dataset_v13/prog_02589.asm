; DESCRIPTION: Composite: Places a cyan dot at position (389, 8) then Draws a red circle centered at (244, 157) with radius 29.
; PLAN: r0=389(x), r1=8(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=157(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 389
LDI r1, 8
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 244
LDI r6, 157
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
