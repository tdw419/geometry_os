; DESCRIPTION: Composite: Sets a single cyan pixel at (135, 16) then Renders a purple disk with center (265, 119) and radius 61.
; PLAN: r0=135(x), r1=16(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=265(x), r6=119(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 135
LDI r1, 16
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 265
LDI r6, 119
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
