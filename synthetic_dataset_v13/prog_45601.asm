; DESCRIPTION: Renders a cyan disk with center (406, 163) and radius 76.
; PLAN: r0=406(x), r1=163(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 163
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
