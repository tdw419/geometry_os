; DESCRIPTION: Composite: Places a cyan dot at position (14, 171) then Draws a cyan circle centered at (352, 128) with radius 11.
; PLAN: r0=14(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=128(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 14
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 128
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
