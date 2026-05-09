; DESCRIPTION: Renders a cyan disk with center (409, 150) and radius 39.
; PLAN: r0=409(x), r1=150(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 150
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
