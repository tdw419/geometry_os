; DESCRIPTION: Composite: Places a cyan dot at position (279, 246) then Creates a yellow circular shape at (202, 157) with radius 66.
; PLAN: r0=279(x), r1=246(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=157(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 246
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 157
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
