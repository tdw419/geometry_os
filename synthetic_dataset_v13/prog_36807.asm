; DESCRIPTION: Renders a cyan disk with center (283, 81) and radius 34.
; PLAN: r0=283(x), r1=81(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 81
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
