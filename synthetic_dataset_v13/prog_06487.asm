; DESCRIPTION: Composite: Places a magenta dot at position (375, 77) then Renders a cyan disk with center (301, 213) and radius 12.
; PLAN: r0=375(x), r1=77(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=213(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 375
LDI r1, 77
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 301
LDI r6, 213
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
