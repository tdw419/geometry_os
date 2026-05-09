; DESCRIPTION: Renders a green disk with center (467, 42) and radius 36.
; PLAN: r0=467(x), r1=42(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 42
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
