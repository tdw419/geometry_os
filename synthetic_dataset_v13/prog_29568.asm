; DESCRIPTION: Composite: Places a cyan dot at position (311, 47) then Draws a white circle centered at (468, 129) with radius 39.
; PLAN: r0=311(x), r1=47(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=468(x), r6=129(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 311
LDI r1, 47
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 468
LDI r6, 129
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
