; DESCRIPTION: Composite: Creates a magenta circular shape at (328, 127) with radius 26 then Sets a single cyan pixel at (429, 12).
; PLAN: r0=328(x), r1=127(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=12(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 328
LDI r1, 127
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 12
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
