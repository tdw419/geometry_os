; DESCRIPTION: Composite: Renders a green disk with center (79, 108) and radius 23 then Places a cyan dot at position (393, 197).
; PLAN: r0=79(x), r1=108(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=197(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 79
LDI r1, 108
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 197
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
