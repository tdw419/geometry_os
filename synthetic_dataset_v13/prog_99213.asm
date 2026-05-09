; DESCRIPTION: Composite: Sets a single cyan pixel at (236, 93) then Renders a purple disk with center (270, 167) and radius 78.
; PLAN: r0=236(x), r1=93(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=167(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 236
LDI r1, 93
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 270
LDI r6, 167
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
