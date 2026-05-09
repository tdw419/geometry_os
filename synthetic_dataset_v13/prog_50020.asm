; DESCRIPTION: Renders a cyan disk with center (64, 116) and radius 64.
; PLAN: r0=64(x), r1=116(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 116
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
