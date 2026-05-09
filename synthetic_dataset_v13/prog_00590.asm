; DESCRIPTION: Renders a cyan disk with center (128, 99) and radius 39.
; PLAN: r0=128(x), r1=99(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 99
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
