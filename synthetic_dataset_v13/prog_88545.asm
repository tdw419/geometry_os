; DESCRIPTION: Renders a cyan disk with center (292, 56) and radius 18.
; PLAN: r0=292(x), r1=56(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 56
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
