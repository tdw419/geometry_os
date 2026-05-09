; DESCRIPTION: Composite: Places a magenta circle of radius 39 at center (61, 130) then Sets a single cyan pixel at (6, 84).
; PLAN: r0=61(x), r1=130(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x), r6=84(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 130
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 84
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
