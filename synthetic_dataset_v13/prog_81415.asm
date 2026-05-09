; DESCRIPTION: Composite: Sets a single red pixel at (156, 84) then Creates a cyan circular shape at (213, 194) with radius 59.
; PLAN: r0=156(x), r1=84(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=213(x), r6=194(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 84
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 213
LDI r6, 194
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
