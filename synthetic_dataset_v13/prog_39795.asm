; DESCRIPTION: Composite: Renders a red disk with center (211, 149) and radius 49 then Places a green dot at position (106, 151).
; PLAN: r0=211(x), r1=149(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x), r6=151(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 211
LDI r1, 149
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 151
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
