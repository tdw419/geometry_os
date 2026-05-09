; DESCRIPTION: Renders a cyan disk with center (253, 141) and radius 64.
; PLAN: r0=253(x), r1=141(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 141
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
