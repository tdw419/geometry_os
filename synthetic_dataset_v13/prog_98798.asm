; DESCRIPTION: Renders a cyan disk with center (394, 64) and radius 24.
; PLAN: r0=394(x), r1=64(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 64
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
