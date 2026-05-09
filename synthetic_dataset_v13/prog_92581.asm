; DESCRIPTION: Composite: Places a black circle of radius 51 at center (262, 149) then Sets a single cyan pixel at (219, 32).
; PLAN: r0=262(x), r1=149(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=32(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 262
LDI r1, 149
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 32
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
