; DESCRIPTION: Renders a cyan disk with center (371, 203) and radius 35.
; PLAN: r0=371(x), r1=203(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 203
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
