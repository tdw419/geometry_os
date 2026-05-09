; DESCRIPTION: Composite: Renders a red disk with center (125, 190) and radius 30 then Places a green dot at position (490, 25).
; PLAN: r0=125(x), r1=190(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x), r6=25(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 125
LDI r1, 190
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 25
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
