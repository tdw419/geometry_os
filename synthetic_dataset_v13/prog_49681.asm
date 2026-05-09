; DESCRIPTION: Composite: Renders a yellow box of size 93x23 starting at (76, 104) then Sets a single green pixel at (486, 200).
; PLAN: r0=76(x), r1=104(y), r2=93(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x), r6=200(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 76
LDI r1, 104
LDI r2, 93
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 200
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
