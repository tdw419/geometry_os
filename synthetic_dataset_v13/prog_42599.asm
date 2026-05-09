; DESCRIPTION: Renders a cyan disk with center (253, 160) and radius 49.
; PLAN: r0=253(x), r1=160(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 160
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
