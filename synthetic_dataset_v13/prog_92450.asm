; DESCRIPTION: Renders a cyan disk with center (32, 66) and radius 14.
; PLAN: r0=32(x), r1=66(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 66
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
