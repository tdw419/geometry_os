; DESCRIPTION: Composite: Renders a orange disk with center (350, 113) and radius 55 then Places a red dot at position (256, 151).
; PLAN: r0=350(x), r1=113(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=151(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 113
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 151
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
