; DESCRIPTION: Renders a cyan disk with center (244, 184) and radius 60.
; PLAN: r0=244(x), r1=184(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 184
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
