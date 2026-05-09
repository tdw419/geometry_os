; DESCRIPTION: Composite: Places a cyan dot at position (406, 203) then Creates a white circular shape at (137, 164) with radius 63.
; PLAN: r0=406(x), r1=203(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=164(y), r7=63(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 203
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 137
LDI r6, 164
LDI r7, 63
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
