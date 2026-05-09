; DESCRIPTION: Composite: Sets a single cyan pixel at (311, 235) then Renders a yellow disk with center (60, 180) and radius 49.
; PLAN: r0=311(x), r1=235(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=180(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 311
LDI r1, 235
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 60
LDI r6, 180
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
