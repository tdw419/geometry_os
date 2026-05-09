; DESCRIPTION: Composite: Places a orange dot at position (479, 178) then Places a cyan circle of radius 39 at center (115, 185).
; PLAN: r0=479(x), r1=178(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=115(x), r6=185(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 479
LDI r1, 178
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 115
LDI r6, 185
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
