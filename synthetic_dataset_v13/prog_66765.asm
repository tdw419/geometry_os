; DESCRIPTION: Renders a cyan disk with center (291, 95) and radius 64.
; PLAN: r0=291(x), r1=95(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 95
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
