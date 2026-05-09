; DESCRIPTION: Renders a cyan disk with center (263, 89) and radius 42.
; PLAN: r0=263(x), r1=89(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 89
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
