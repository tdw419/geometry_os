; DESCRIPTION: Composite: Places a cyan dot at position (506, 126) then Renders a yellow disk with center (468, 211) and radius 42.
; PLAN: r0=506(x), r1=126(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=468(x), r6=211(y), r7=42(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 506
LDI r1, 126
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 468
LDI r6, 211
LDI r7, 42
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
