; DESCRIPTION: Renders a cyan disk with center (259, 98) and radius 22.
; PLAN: r0=259(x), r1=98(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 98
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
