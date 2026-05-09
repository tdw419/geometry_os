; DESCRIPTION: Renders a cyan disk with center (128, 216) and radius 28.
; PLAN: r0=128(x), r1=216(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 216
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
