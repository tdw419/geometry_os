; DESCRIPTION: Renders a cyan disk with center (474, 224) and radius 29.
; PLAN: r0=474(x), r1=224(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 224
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
