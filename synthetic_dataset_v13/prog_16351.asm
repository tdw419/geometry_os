; DESCRIPTION: Composite: Sets a single yellow pixel at (235, 154) then Renders a blue disk with center (187, 163) and radius 41.
; PLAN: r0=235(x), r1=154(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=163(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 154
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 187
LDI r6, 163
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
