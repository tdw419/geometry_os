; DESCRIPTION: Composite: Places a yellow dot at position (444, 212) then Creates a cyan circular shape at (136, 95) with radius 35.
; PLAN: r0=444(x), r1=212(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=95(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 444
LDI r1, 212
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 136
LDI r6, 95
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
