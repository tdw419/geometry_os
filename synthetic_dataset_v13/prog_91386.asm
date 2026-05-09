; DESCRIPTION: Composite: Renders a black box of size 110x31 starting at (164, 40) then Places a cyan dot at position (409, 98).
; PLAN: r0=164(x), r1=40(y), r2=110(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=98(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 40
LDI r2, 110
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 98
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
