; DESCRIPTION: Renders a green disk with center (327, 45) and radius 42.
; PLAN: r0=327(x), r1=45(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 45
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
