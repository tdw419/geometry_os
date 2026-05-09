; DESCRIPTION: Renders a cyan disk with center (320, 99) and radius 80.
; PLAN: r0=320(x), r1=99(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 99
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
