; DESCRIPTION: Composite: Places a red dot at position (258, 112) then Draws a cyan circle centered at (327, 194) with radius 34.
; PLAN: r0=258(x), r1=112(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=194(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 258
LDI r1, 112
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 327
LDI r6, 194
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
