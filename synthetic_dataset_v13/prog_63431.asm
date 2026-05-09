; DESCRIPTION: Renders a cyan disk with center (244, 130) and radius 24.
; PLAN: r0=244(x), r1=130(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 130
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
