; DESCRIPTION: Composite: Renders a cyan box of size 119x110 starting at (245, 42) then Sets a single blue pixel at (498, 14).
; PLAN: r0=245(x), r1=42(y), r2=119(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=498(x), r6=14(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 245
LDI r1, 42
LDI r2, 119
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 14
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
