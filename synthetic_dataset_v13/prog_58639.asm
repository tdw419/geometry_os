; DESCRIPTION: Composite: Renders a magenta disk with center (333, 188) and radius 57 then Places a black dot at position (379, 149).
; PLAN: r0=333(x), r1=188(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=149(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 188
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 149
LDI r7, 0x000000
PSET r5, r6, r7
HALT
