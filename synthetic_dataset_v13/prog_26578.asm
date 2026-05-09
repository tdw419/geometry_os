; DESCRIPTION: Composite: Places a magenta dot at position (265, 77) then Places a cyan circle of radius 59 at center (155, 111).
; PLAN: r0=265(x), r1=77(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=111(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 265
LDI r1, 77
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 155
LDI r6, 111
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
