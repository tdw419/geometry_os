; DESCRIPTION: Composite: Places a cyan circle of radius 42 at center (75, 211) then Sets a single red pixel at (326, 168).
; PLAN: r0=75(x), r1=211(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=168(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 211
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 168
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
