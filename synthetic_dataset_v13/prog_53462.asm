; DESCRIPTION: Renders a cyan disk with center (271, 105) and radius 11.
; PLAN: r0=271(x), r1=105(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 105
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
