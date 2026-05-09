; DESCRIPTION: Composite: Sets a single cyan pixel at (197, 207) then Places a red circle of radius 61 at center (189, 188).
; PLAN: r0=197(x), r1=207(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=188(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 197
LDI r1, 207
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 188
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
