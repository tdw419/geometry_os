; DESCRIPTION: Renders a cyan disk with center (283, 141) and radius 19.
; PLAN: r0=283(x), r1=141(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 141
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
