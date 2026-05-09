; DESCRIPTION: Composite: Places a orange dot at position (286, 231) then Places a white circle of radius 26 at center (374, 128).
; PLAN: r0=286(x), r1=231(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=128(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 231
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 374
LDI r6, 128
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
