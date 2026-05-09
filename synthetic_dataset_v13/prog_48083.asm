; DESCRIPTION: Composite: Places a white dot at position (44, 177) then Places a red circle of radius 21 at center (372, 231).
; PLAN: r0=44(x), r1=177(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=231(y), r7=21(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 44
LDI r1, 177
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 231
LDI r7, 21
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
