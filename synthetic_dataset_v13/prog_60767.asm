; DESCRIPTION: Composite: Sets a single green pixel at (187, 203) then Places a white circle of radius 13 at center (13, 231).
; PLAN: r0=187(x), r1=203(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=13(x), r6=231(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 203
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 13
LDI r6, 231
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
