; DESCRIPTION: Renders a cyan disk with center (76, 75) and radius 13.
; PLAN: r0=76(x), r1=75(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 75
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
