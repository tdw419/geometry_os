; DESCRIPTION: Composite: Creates a magenta circular shape at (137, 168) with radius 50 then Sets a single cyan pixel at (64, 90).
; PLAN: r0=137(x), r1=168(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x), r6=90(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 168
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 90
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
