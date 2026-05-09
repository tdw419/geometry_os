; DESCRIPTION: Composite: Sets a single cyan pixel at (24, 40) then Draws a white circle centered at (230, 82) with radius 67.
; PLAN: r0=24(x), r1=40(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=82(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 40
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 82
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
