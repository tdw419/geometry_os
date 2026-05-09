; DESCRIPTION: Composite: Places a cyan dot at position (337, 123) then Renders a green disk with center (452, 168) and radius 24.
; PLAN: r0=337(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=452(x), r6=168(y), r7=24(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 337
LDI r1, 123
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 452
LDI r6, 168
LDI r7, 24
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
