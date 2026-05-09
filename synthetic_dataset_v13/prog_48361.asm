; DESCRIPTION: Renders a cyan disk with center (416, 191) and radius 64.
; PLAN: r0=416(x), r1=191(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 191
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
