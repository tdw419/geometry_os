; DESCRIPTION: Renders a cyan disk with center (278, 237) and radius 14.
; PLAN: r0=278(x), r1=237(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 237
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
