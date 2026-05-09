; DESCRIPTION: Composite: Places a cyan dot at position (334, 198) then Places a orange circle of radius 69 at center (359, 79).
; PLAN: r0=334(x), r1=198(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=79(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 334
LDI r1, 198
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 79
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
