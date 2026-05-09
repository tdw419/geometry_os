; DESCRIPTION: Composite: Places a yellow dot at position (392, 109) then Renders a blue disk with center (467, 42) and radius 14.
; PLAN: r0=392(x), r1=109(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=467(x), r6=42(y), r7=14(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 392
LDI r1, 109
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 467
LDI r6, 42
LDI r7, 14
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
