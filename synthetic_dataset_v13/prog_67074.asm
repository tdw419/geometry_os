; DESCRIPTION: Composite: Renders a magenta disk with center (357, 96) and radius 51 then Places a green dot at position (149, 254).
; PLAN: r0=357(x), r1=96(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x), r6=254(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 357
LDI r1, 96
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 254
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
