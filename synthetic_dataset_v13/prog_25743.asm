; DESCRIPTION: Composite: Places a magenta circle of radius 27 at center (324, 132) then Sets a single yellow pixel at (386, 227).
; PLAN: r0=324(x), r1=132(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x), r6=227(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 132
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 227
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
