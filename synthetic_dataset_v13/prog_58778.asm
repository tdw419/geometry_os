; DESCRIPTION: Composite: Places a orange circle of radius 16 at center (311, 39) then Places a blue dot at position (272, 221).
; PLAN: r0=311(x), r1=39(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=221(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 39
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 221
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
