; DESCRIPTION: Composite: Sets a single cyan pixel at (475, 171) then Places a red circle of radius 18 at center (408, 29).
; PLAN: r0=475(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=29(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 475
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 29
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
