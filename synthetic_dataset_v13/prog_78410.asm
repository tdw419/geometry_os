; DESCRIPTION: Composite: Renders a green disk with center (145, 208) and radius 47 then Places a purple dot at position (134, 231).
; PLAN: r0=145(x), r1=208(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=231(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 145
LDI r1, 208
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 231
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
