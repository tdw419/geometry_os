; DESCRIPTION: Composite: Renders a cyan box of size 60x56 starting at (386, 98) then Sets a single magenta pixel at (496, 132).
; PLAN: r0=386(x), r1=98(y), r2=60(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x), r6=132(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 98
LDI r2, 60
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 132
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
