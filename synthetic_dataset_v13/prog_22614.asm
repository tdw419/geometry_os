; DESCRIPTION: Renders a cyan disk with center (134, 23) and radius 20.
; PLAN: r0=134(x), r1=23(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 23
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
